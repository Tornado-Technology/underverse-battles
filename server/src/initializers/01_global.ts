import App from '../app.js';
import { ban, banUsername } from '../database/schemas/ban.js';

// Some method provided for global to usage in console
global.app = App;
global.commands = {
  context: undefined,
  ban,
  banUsername,
};

// Set default context
global.commands.context = global.commands;
