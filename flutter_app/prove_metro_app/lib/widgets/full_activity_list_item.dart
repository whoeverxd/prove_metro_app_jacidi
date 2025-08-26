import 'package:flutter/material.dart';
import 'package:prove_metro_app/models/activity.dart';

import '../pages/activity/DetailsPage.dart';
/*
* Hubiese estado cool Reusar el item de la lista principal, pero quise hacer este widget aparte para probar cosas nuevas
* */
class FullActivityListItem extends StatefulWidget {
  final Activity activity;
  const FullActivityListItem({
    super.key,
    required bool isEnrolled,
    required bool canEnroll,
    required this.activity,
  });

  @override
  State<FullActivityListItem> createState() => _FullActivityListItemState();
}

class _FullActivityListItemState extends State<FullActivityListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (context) => const Detailspage()),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // esquinas redondeadas
        ),
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  widget.activity.imagen,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.fitness_center,
                          size: 50,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Error cargando la imagen:\n${widget.activity.imagen}\n$error',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
