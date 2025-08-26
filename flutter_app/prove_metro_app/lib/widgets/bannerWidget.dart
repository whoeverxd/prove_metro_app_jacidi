import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 169, // altura de la imagen original
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/HEADER_WELCOME_TO_THE_CLUB-300x169.jpg'),
          fit: BoxFit.cover, // Ajusta la imagen al contenedor
        ),
      ),
    );
  }
}
