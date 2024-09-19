export enum statusCode {
  error,
  success,
  serverSocketClosed,
  
  // Database operations
  databaseError,
  databaseNotConnected,
  databaseDisable,
  
  // Account
  userNotLoggedIn,
  databaseAccountNotExists,
  databaseAccountExists,
  accountWasBanned,
  
  // Profile
  databaseProfileNotExists,
  databaseProfileExists,
  
  // Username
  databaseUsernameBusy,
  databaseUsernameWrong,
  usernameDoesNotComplyWithRules,

  // Nickname
  databaseNicknameBusy,
  databaseNicknameWrong,
  nicknameDoesNotComplyWithRules,
  
  // Password
  databasePasswordWrong,
  passwordDoesNotComplyWithRules,
  
  // E-mail
  databaseEmailBusy,
  databaseEmailWrong,
  emailDoesNotComplyWithRules,
  
  // Verification
  databaseVerificationWrongCode,
  databaseVerificationTimeout,
  
  // Ban
  databaseBanExists,

  // Request
  requestAlreadySent,

  // Friends
  databaseFriendNotExists,
  canNotAddYourselfAsFriend,
  userIsFriendAlready,

  // Fight
  canNotFightYourself,
  userInFightAlready,
  
  // Update
  updateRequired
}
