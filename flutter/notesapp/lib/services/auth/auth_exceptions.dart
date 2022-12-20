// login exception
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// register  exception
class WeakPasswordAuthException implements Exception {}

class EmailalreadyinuseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

// generic exeptions

class GenricAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
