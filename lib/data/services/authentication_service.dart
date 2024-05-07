import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
  final FirebaseFirestore _firestore;

  AuthenticationService(this._firestore);

  Future<bool> signIn(String password) async {
    try {
      final snapshot = await _firestore.collection('app').doc('config').get();
      
      final List<dynamic> passwords = snapshot.get("passwords");

      await Future.delayed(const Duration(seconds: 3));
      if (passwords.contains(password)) {
        return true;
      }

      return false;
    } catch (e) {
      print('Auth Error = $e');
      return false;
    }
  }
}
