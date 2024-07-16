export enum statusCode {
  error = 0,
  success = 1,
  serverSocketClosed = 2,
  
  // 300 - Database operations
  databaseError = 300,
  databaseNotConnected = 301,
  databaseDisable = 302,
  
  // Account
  databaseAccountNotExists = 303,
  databaseAccountExists = 304,
  
  // Profile
  databaseProfileNotExists = 305,
  databaseProfileExists = 306,
  
  // Username
  databaseUsernameBusy = 307,
  databaseUsernameWrong = 308,
  
  // Password
  databasePasswordWrong = 309,
  
  // E-mail
  databaseEmailBusy = 310,
  databaseEmailWrong = 311,
  
  // Verification
  databaseVerificationWrongCode = 312,
  databaseVerificationTimeout = 313,
  
  // Ban
  databaseBanExists = 314,
  
  // Friends
  databaseFriendNotExists = 315,
  
  // 400 - ???
  updateRequired = 426
}
