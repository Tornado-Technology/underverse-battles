import { Account } from '../../database/schemas/account.js';
import { Profile } from '../../database/schemas/profile.js';
import { tokenAccess } from '../../database/schemas/token.js';
import { ApiCommand, apiCommandAccess } from '../command.js';

export const command = new ApiCommand('/profile', apiCommandAccess.Authorized, tokenAccess.default, async (cmd, _req, res, url, method) => {
  if (method !== 'GET') return;

  const username = url.searchParams.get('username');
  const account = await Account.findOne({ username }).clone();

  if (!account) {
    cmd.send(res, {
      error: `Account with username ${username} don't exists!`,
    });

    return;
  }

  const profile = await Profile.findOne({ accountId: account._id }).clone();
  
  if (!profile) {
    cmd.send(res, {
      error: `Profile with username ${username} don't exists!`,
    });

    return;
  }

  cmd.send(res, {
    accountId: account._id,
    username: account.username,
    nickname: account.nickname,
    date: account.date,
    online: profile.online,
    lastOnline: profile.lastOnline,
    friends: profile.friends,
    rating: profile.rating,
    gold: profile.gold,
    badge: profile.badge,
  });
});
