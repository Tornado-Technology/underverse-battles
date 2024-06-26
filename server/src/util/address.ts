export class Address {
  public readonly ip: string;
  public readonly port: number;
  
  constructor(ip: string, port: number) {
    this.ip = ip;
    this.port = port;
  }

  public toString() {
    return `${this.ip}:${this.port}`;
  }
}