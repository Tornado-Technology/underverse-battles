import { tokenAccess } from '../../database/schemas/token.js';
import { ApiCommand, apiCommandAccess } from '../command.js';

export const command = new ApiCommand('/teapot', apiCommandAccess.Guest, tokenAccess.default, (cmd, _req, res, _url, _method) => {
  cmd.send(res, {}, 418);
});
