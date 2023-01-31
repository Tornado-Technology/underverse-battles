import { randomBytes, scrypt, timingSafeEqual } from 'crypto';

export const hashPassword = async (password: string): Promise<string> => (
  new Promise((resolve, reject) => {
    const salt = randomBytes(8).toString('hex');

    scrypt(password, salt, 16, (error, derivedKey) => {
      if (error) {
        reject(error);
        return;
      }

      resolve(`${salt}:${derivedKey.toString('hex')}`);
    })
  })
);

export const verifyPassword = async (password: string, value: string): Promise<boolean | Error> => (
  new Promise((resolve, reject) => {
    const [salt, hash] = value.split(':');
    const hashBuffer = Buffer.from(hash, 'hex');

    scrypt(password, salt, 16, (error, derivedKey) => {
      if (error) {
        reject(error);
      }

      resolve(timingSafeEqual(hashBuffer, derivedKey));
    })
  })
);
