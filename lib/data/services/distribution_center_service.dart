import 'package:ajuda_rs_cadastramento/commons/helpers/distribution_center_helper.dart';
import 'package:ajuda_rs_cadastramento/data/models/distribution_center.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DistributionCenterService {
  final FirebaseFirestore _firestore;

  DistributionCenterService(this._firestore);

  Future<(String, String)> createDistributionCenter(DistributionCenterModel newDistributionCenter) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      
      // generate login and password
      String password = DistributionCenterHelper.generateRandomPassword();
      String login = DistributionCenterHelper.generateRandomLogin();
      // create doc
      final DocumentReference document = _firestore.collection('/locals').doc();
      Map<String,dynamic> distributionCenterJson = newDistributionCenter.toJson();

      // update data
      distributionCenterJson['password'] = password;
      distributionCenterJson['login'] = login;
      distributionCenterJson['id'] = document.id;
      
      await document.set(distributionCenterJson);
      return (login, password);
    } catch (e) {
      print('Create Distribution Center Error = $e');
    }
    return ("", "");
  }
  
  Future<void> updateDistributionCenter( ) async {
    try {
      
    } catch (e) {
      print('Auth Error = $e');
    }
  }
  
  Future<void> deleteDistributionCenter( ) async {
    try {
      
    } catch (e) {
      print('Auth Error = $e');
    }
  }
}
