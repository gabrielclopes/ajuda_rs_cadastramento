import 'package:cloud_firestore/cloud_firestore.dart';

class ConfigService {
  final FirebaseFirestore _firestore;

  ConfigService(this._firestore);

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

  Future<List<String>> loadServiceTypes() async {
    List<String> serviceTypes = [];
    try{
      final snapshot = await _firestore.collection('app').doc('config').get();
      serviceTypes = snapshot.get("serviceTypes").cast<String>();
    } catch (e) {
      print('Load Service Types Error = $e');
    }
    return serviceTypes;
  }


}
