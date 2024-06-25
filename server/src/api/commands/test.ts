import { tokenAccess } from '../../database/schemas/token.js';
import { ApiCommand, apiCommandAccess } from '../command.js';

export const command = new ApiCommand('/test', apiCommandAccess.Guest, tokenAccess.default, (cmd, _req, res, _url, method) => {
  if (method !== 'GET') {
    cmd.send(res, {
      message: 'Fuck you <3',
    });

    return;
  }

  cmd.send(res, {
    message: 'Hello from server!'
  });
});
