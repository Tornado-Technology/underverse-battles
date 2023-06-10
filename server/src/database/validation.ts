import { usernameDefault } from './schemas/account.js';
import { statusCode } from '../status.js';
import { Account } from './schemas/account.js';

// If you want to change the password and name styles, change RegEx below
const passwordRegex = /^(?=.*[a-z])(?=.*\d)[A-Za-z\d!@#$%^&*?~]{6,}$/;
const usernameRegex = /^[a-zA-Z_][a-zA-Z0-9_.-]{1,29}$/;
const nickanmeRegex = /^[a-zA-Z_][a-zA-Z0-9_.-]{1,29}$/;

const usernameBlacklist = [
  usernameDefault,
];

const nikcnameBlacklist = [];

export const validatePassword = (password: string): number => {
  return passwordRegex.test(password) ? statusCode.success : statusCode.databasePasswordWrong;
}

export const validateUsername = async (username: string): Promise<statusCode> => {
  if (!usernameRegex.test(username) || usernameBlacklist.find((item) => item === username) !== undefined) {
    return statusCode.databaseUsernameWrong;
  }

  return await Account.findOne({ username }) ? statusCode.databaseUsernameBusy : statusCode.success;
}

export const validateNikcname = (nickname: string): statusCode => {
  if (!nickanmeRegex.test(nickname) || nikcnameBlacklist.find((item) => item === nickname) !== undefined) {
    return statusCode.databaseUsernameWrong;
  }

  return statusCode.success;
}

export const validateEmail = async (email: string): Promise<number> => {
  return await Account.findOne({ email }) ? statusCode.databaseEmailBusy : statusCode.success;
}

export const infoValidate = async (username: string, password: string, email: string): Promise<number> => {
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