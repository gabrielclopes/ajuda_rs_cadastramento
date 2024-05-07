import 'dart:math';

class DistributionCenterHelper {
  static const String _passwordCharacters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz';
  static const String _loginCharacters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'  ;

  static String generateRandomLogin({int size = 5}){
    String login = '';
    int charLen = _loginCharacters.length;
    var rng = Random();
    for (int i = 0; i < size; i++) {
      int charIndex = rng.nextInt(charLen);
      login += _loginCharacters[charIndex];
    }
    return login;
  }
  
  
  static String generateRandomPassword({int size = 8}){
    String password = '';
    int charLen = _passwordCharacters.length;
    var rng = Random();
    for (int i = 0; i < size; i++) {
      int charIndex = rng.nextInt(charLen);
      password += _passwordCharacters[charIndex];
    }
    return password;
  }




}