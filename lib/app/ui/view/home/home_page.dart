import 'package:ajuda_rs_cadastramento/app/ui/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:ajuda_rs_cadastramento/app/ui/bloc/manage_distribution_center_bloc/manage_distribution_center_bloc.dart';
import 'package:ajuda_rs_cadastramento/app/ui/view/home/components/body.dart';
import 'package:ajuda_rs_cadastramento/data/services/authentication_service.dart';
import 'package:ajuda_rs_cadastramento/data/services/distribution_center_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FirebaseFirestore _firestore;

  @override
  void initState() {
    super.initState();
    _firestore = FirebaseFirestore.instance;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'AJUDA RS - CENTRAL DE CADASTRAMENTOS',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => AuthenticationBloc(AuthenticationService(_firestore)),),
          BlocProvider(create: (BuildContext context) => DistributionCenterBloc(DistributionCenterService(_firestore)),)
        ],
         
        child: const AppBody(),
      ),
    );
  }
}
