import { encode, decode } from '@msgpack/msgpack';
import { handlePacket } from './handleStuff.js';
import Client from '../concepts/client.js';
import Logger from '../util/logging.js';

export default class Packet {
  public static build(data: object): Uint8Array {
    const dataBuffer = encode(data);
    const sizeBuffer = Buffer.alloc(4);
    sizeBuffer.writeUInt32LE(dataBuffer.length);
    
    return Buffer.concat([sizeBuffer, dataBuffer], dataBuffer.length + 4);
  }

  public static buildWs(data: object): Uint8Array {
    return encode(data);
  }

  public static async parse(client: Client, data: Buffer): Promise<void> {
    if (client.halfpack) {
      data = Buffer.concat([client.halfpack, data], client.halfpack.length + data.length);
      client.halfpack = null;
    }

    const dataSize = data.length;
    for (let i = 0; i < dataSize;) {
      if (i + 4 > dataSize) {
        client.halfpack = Buffer.alloc(dataSize - i);
        data.copy(client.halfpack, 0, i, dataSize);
        break;
      }

      const packSize = data.readUInt32LE(i);
      i += 4;

      if (i + packSize > dataSize) {
        i -= 4;
        client.halfpack = Buffer.alloc(dataSize - i);
        data.copy(client.halfpack, 0, i, dataSize);
        break;
      }

      const dataPack = Buffer.alloc(packSize);
      data.copy(dataPack, 0, i, i + packSize);
      i += packSize;

      try {
        await handlePacket(client, decode(dataPack));
      } catch (error) {
        Logger.error(`An error occurred while parsing the packet: ${error}`);
      }
    }
  }
}
