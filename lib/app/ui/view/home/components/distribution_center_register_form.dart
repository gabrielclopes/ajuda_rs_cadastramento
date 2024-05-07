import 'package:ajuda_rs_cadastramento/commons/validator/authentication_validator.dart';
import 'package:flutter/material.dart';

class DistributionCenterRegisterForm extends StatelessWidget {
  DistributionCenterRegisterForm({super.key});
  
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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(30), 
      // actions: [
      //   ElevatedButton(
      //       onPressed: () async {
      //         scheduleController.text.isEmpty
      //             ? scheduleController.text = ''
      //             : scheduleController.text = scheduleController.text;
      //         contactController.text.isEmpty
      //             ? contactController.text = ''
      //             : contactController.text = contactController.text;
      //         observationController.text.isEmpty
      //             ? observationController.text = ''
      //             : observationController.text = observationController.text;
      //         productsController.text.isEmpty
      //             ? productsController.text = ''
      //             : productsController.text = productsController.text;
      //         if (nameController.text.isNotEmpty &&
      //             cityController.text.isNotEmpty &&
      //             addressController.text.isNotEmpty &&
      //             geoPointLatController.text.isNotEmpty &&
      //             geoPointLongController.text.isNotEmpty) {
      //           // await dataBaseService.setDistributionCenter(DistributionCenter(
      //           //     name: nameController.text,
      //           //     password: '',
      //           //     city: cityController.text,
      //           //     address: addressController.text,
      //           //     geoPoint: GeoPoint(double.parse(geoPointLatController.text),
      //           //         double.parse(geoPointLongController.text)),
      //           //     id: '',
      //           //     schedule: scheduleController.text,
      //           //     contact: contactController.text,
      //           //     observation: observationController.text,
      //           //     login: '',
      //           //     products: productsController.text.split(',')));
                
      //         } else {
      //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //               content: Text('Preencha todos os campos de localização')));
      //         }
      //       },
      //       child: Text('SALVAR')),
      //   ElevatedButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       child: Text('CANCELAR'))
      // ],
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
                  child: Column(
                    children: [
                      TextFormField(
                          validator: EmptyValidator.empty,
                          controller: nameController,
                          decoration: const InputDecoration(hintText: 'NOME')),
                      TextField(
                          controller: cityController,
                          decoration: const InputDecoration(hintText: 'CIDADE')),
                      TextField(
                          controller: addressController,
                          decoration: const InputDecoration(hintText: 'ENDEREÇO')),
                      TextField(
                          controller: scheduleController,
                          decoration:
                              const InputDecoration(hintText: 'HORÁRIO DE FUNCIONAMENTO')),
                      TextField(
                          controller: geoPointLatController,
                          decoration: const InputDecoration(hintText: 'LATITUDE')),
                      TextField(
                          controller: geoPointLongController,
                          decoration: const InputDecoration(hintText: 'LONGITUDE')),
                      TextField(
                          controller: contactController,
                          decoration: const InputDecoration(hintText: 'CONTATO')),
                      TextField(
                          controller: observationController,
                          decoration: const InputDecoration(hintText: 'OBSERVAÇÃO')),
                      TextField(
                          controller: productsController,
                          decoration: const InputDecoration(
                              hintText: 'PRODUTOS (SEPARAR POR VIRGULAS)')),
                    ],
                  ),
                ),
              ),
             const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                ElevatedButton(child: const Text('LIMPAR'), onPressed: (){},),
                ElevatedButton(child: const Text('SALVAR'), onPressed: (){},),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}