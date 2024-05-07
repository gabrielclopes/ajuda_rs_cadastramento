import 'package:flutter/material.dart';

class DistributionCenterListView extends StatelessWidget {
  const DistributionCenterListView({super.key});

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
                    'LISTA DE CENTROS DE DISTRIBUIÇÃO DE DOAÇÕES'),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("ListView Item"),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 20,),
            ElevatedButton(child: const Text('ATUALIZAR LISTA'), onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}