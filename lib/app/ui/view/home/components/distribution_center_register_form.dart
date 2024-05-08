import 'package:ajuda_rs_cadastramento/app/ui/bloc/manage_distribution_center_bloc/manage_distribution_center_bloc.dart';
import 'package:ajuda_rs_cadastramento/app/ui/bloc/manage_distribution_center_bloc/manage_distribution_center_events.dart';
import 'package:ajuda_rs_cadastramento/commons/states/base_state.dart';
import 'package:ajuda_rs_cadastramento/commons/validator/authentication_validator.dart';
import 'package:ajuda_rs_cadastramento/data/models/distribution_center.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistributionCenterRegisterForm extends StatefulWidget {
  const DistributionCenterRegisterForm({super.key});

  @override
  State<DistributionCenterRegisterForm> createState() => _DistributionCenterRegisterFormState();
}

class _DistributionCenterRegisterFormState extends State<DistributionCenterRegisterForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController geoPointLatController = TextEditingController();
  final TextEditingController geoPointLongController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController observationController = TextEditingController();
  final TextEditingController productsController = TextEditingController();
  final TextEditingController volunteerController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController loginController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final DistributionCenterBloc _distributionCenterBloc;

  @override
  void initState() {
    super.initState();
    _distributionCenterBloc = BlocProvider.of<DistributionCenterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(30), 
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ColoredBox(
          color: Colors.white,
          child: Column(
            children: [
              const Text(
                    'PREENCHA O FORMULÁRIO PARA ADICIONAR UM CENTRO DE DISTRIBUIÇÃO'),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: nameController,
                            decoration: const InputDecoration(hintText: 'NOME')),
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: cityController,
                            decoration: const InputDecoration(hintText: 'CIDADE')),
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: addressController,
                            decoration: const InputDecoration(hintText: 'ENDEREÇO')),
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: scheduleController,
                            decoration:
                                const InputDecoration(hintText: 'HORÁRIO DE FUNCIONAMENTO')),
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: geoPointLatController,
                            decoration: const InputDecoration(hintText: 'LATITUDE')),
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: geoPointLongController,
                            decoration: const InputDecoration(hintText: 'LONGITUDE')),
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: contactController,
                            decoration: const InputDecoration(hintText: 'CONTATO')),
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: observationController,
                            decoration: const InputDecoration(hintText: 'OBSERVAÇÃO')),
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: productsController,
                            decoration: const InputDecoration(
                                hintText: 'PRODUTOS (SEPARAR POR VIRGULAS)')),
                        TextFormField(
                            validator: EmptyValidator.empty,
                            controller: volunteerController,
                            decoration: const InputDecoration(
                                hintText: 'TIPOS DE VOLUNTÁRIOS (SEPARAR POR VIRGULAS)')),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('LIMPAR'),
                    onPressed: () {},
                  ),
                  BlocBuilder<DistributionCenterBloc, BaseState>(
                      builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is LoadingState
                          ? null : () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            GeoPoint geoPoint = GeoPoint(double.parse(geoPointLatController.text), double.parse(geoPointLongController.text));
                            DateTime now = DateTime.now();
                            DistributionCenterModel distributionCenter = 
                              DistributionCenterModel(
                                name: nameController.text, 
                                password: '', 
                                city: cityController.text.trim().toUpperCase(), 
                                address: addressController.text, 
                                geoPoint: geoPoint, 
                                id: '', 
                                schedule: scheduleController.text, 
                                contact: contactController.text, 
                                observation: observationController.text, 
                                login: '', 
                                products: productsController.text.split(','), 
                                lastUpdateTime: now, 
                                volunteers: volunteerController.text.split(',')
                              );

                            _distributionCenterBloc.add(CreateDistributionCenterEvent(distributionCenter: distributionCenter));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Erro no preenchimento dos dados. Verifique se a latitude e longitude estão escritas corretamente'), duration: Duration(seconds: 6),)
                            );
                          }
                        }
                      },
                      child: state is LoadingState
                          ? const SizedBox(height: 10, width: 10,child: CircularProgressIndicator(),)
                          : const Text('SALVAR'),
                    );
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}