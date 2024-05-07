import 'package:ajuda_rs_cadastramento/app/app.dart';
import 'package:ajuda_rs_cadastramento/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}




