import 'package:flutter/material.dart';
import 'package:prove_metro_app/globals/custom_app_bar.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  CustomAppBar(title: 'DETALLES DE LA ACTIVIDAD',

        ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        )
      )
    );
  }
}
