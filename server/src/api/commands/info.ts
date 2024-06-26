import config from '../../config.js';
import { tokenAccess } from '../../database/schemas/token.js';
import { ApiCommand, apiCommandAccess } from '../command.js';

export const command = new ApiCommand('/info', apiCommandAccess.Authorized, tokenAccess.default, async (cmd, _req, res, _url, method) => {
  if (method !== 'GET') return;

  cmd.send(res, {
    meta: config.meta,
    gameplay: config.gameplay,
    client: config.client,
  });
});
