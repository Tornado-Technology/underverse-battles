import { usernameDefault, Account } from './schemas/account.js';
import { statusCode } from '../status.js';

// If you want to change the password and name styles, change RegEx below
const passwordRegex = /^(?=.*[a-z])(?=.*\d)[A-Za-z\d!@#$%^&*?~]{6,999}$/;
const usernameRegex = /^[a-zA-Z][a-zA-Z0-9_.]{1,29}$/;
const nicknameRegex = /^[a-zA-Z0-9_.!?]{1,29}$/;

const usernameBlacklist = [
  usernameDefault,
];

const nicknameBlacklist = [];

export const validatePassword = (password: string): statusCode => {
  return passwordRegex.test(password) ? statusCode.success : statusCode.passwordDoesNotComplyWithRules;
}

export const validateUsername = async (username: string): Promise<statusCode> => {
  if (!usernameRegex.test(username)) {
    return statusCode.usernameDoesNotComplyWithRules;
  }
  if (usernameBlacklist.find((item) => item === username) !== undefined) {
    return statusCode.databaseUsernameWrong;
  }

  return await Account.findOne({ username }) ? statusCode.databaseUsernameBusy : statusCode.success;
}

export const validateNickname = async (nickname: string): Promise<statusCode> => {
  if (!nicknameRegex.test(nickname)) {
    return statusCode.nicknameDoesNotComplyWithRules;
  }
  if (nicknameBlacklist.find((item) => item === nickname) !== undefined) {
    return statusCode.databaseNicknameWrong;
  }

  return statusCode.success;
}

export const validateEmail = async (email: string): Promise<statusCode> => {
  return await Account.findOne({ email }) ? statusCode.databaseEmailBusy : statusCode.success;
}

export const infoValidate = async (username: string, password: string, email: string): Promise<statusCode> => {
  const usernameValidation = await validateUsername(username);
  if (usernameValidation !== statusCode.success) {
    return usernameValidation;
  }

  const passwordValidation = validatePassword(password);
  if (passwordValidation !== statusCode.success) {
    return passwordValidation;
  }

  const emailValidation = await validateEmail(email);
  if (emailValidation !== statusCode.success) {
    return emailValidation;
  }

  return statusCode.success;
}
