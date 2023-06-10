import * as Mongoose from 'mongoose';
import Client from './concepts/client/client.js';
import Fight from './game/fight/fight.js';

export default class App {
  public static readonly fights: Fight[] = [];
  public static readonly clients: Client[] = [];

  public static database: Mongoose.Connection;
  public static pingStartTime: number;
  public static pingInterval: NodeJS.Timeout;
}
