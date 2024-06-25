import { Account } from '../../database/schemas/account.js';
import { tokenAccess } from '../../database/schemas/token.js';
import { ApiCommand, apiCommandAccess } from '../command.js';
import { ban } from '../../database/schemas/ban.js';

export const command = new ApiCommand('/ban', apiCommandAccess.Authorized, tokenAccess.administrator, async (cmd, _req, res, url, method) => {
  if (method !== 'POST') return;

  const token = url.searchParams.get('token');
  const username = url.searchParams.get('username');
  const reason = url.searchParams.get('reason');

  const account = await Account.findOne({ username }).clone();

  if (!account) {
    cmd.send(res, {
      error: `Account with username ${username} don't exists!`,
    });

    return;
  }

  try {
    const code = await ban(account._id, token, reason ?? '');
    cmd.send(res, {
      code,
    });
  } catch (error) {
    cmd.send(res, {
      error,
    });
  }
});
