import 'package:cloud_firestore/cloud_firestore.dart';

class DistributionCenterModel {
  final String name;
  final String city;
  final String address;
  final GeoPoint geoPoint;
  final String id;
  final String schedule;
  final String contact;
  final String observation;
  final List<String> products;
  final String password;
  final String login;
  final DateTime lastUpdateTime;
  final List<String> volunteers;
  final List<String> type;

  const DistributionCenterModel({
    required this.name,
    required this.password,
    required this.city,
    required this.address,
    required this.geoPoint,
    required this.id,
    required this.schedule,
    required this.contact,
    required this.observation,
    required this.login,
    required this.products,
    required this.lastUpdateTime,
    required this.volunteers,
    required this.type
  });



  factory DistributionCenterModel.fromJson(Map<String, dynamic> json) {
    List<String> products = json['products'].toList().cast<String>();
    List<String> volunteers = json['volunteers'].toList().cast<String>();
    List<String> type = json['type'].toList().cast<String>();

    final DateTime lastUpdateTime =
        (json['lastUpdateTime'] as Timestamp).toDate();

    return DistributionCenterModel(
        name: json['name'],
        city: json['city'],
        address: json['address'],
        geoPoint: json['geoPoint'],
        id: json['id'],
        schedule: json['schedule'],
        contact: json['contact'],
        observation: json['observation'],
        products: products,
        password: json['password'],
        login: json['login'],
        lastUpdateTime: lastUpdateTime,
        volunteers: volunteers,
        type: type
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city': city,
      'address': address,
      'id': id,
      'schedule': schedule,
      'contact': contact,
      'geoPoint': geoPoint,
      'observation': observation,
      'products': products,
      'login': login,
      'password': password,
      'lastUpdateTime': Timestamp.fromDate(lastUpdateTime),
      'volunteers': volunteers,
      'type': type
    };
  }
}
