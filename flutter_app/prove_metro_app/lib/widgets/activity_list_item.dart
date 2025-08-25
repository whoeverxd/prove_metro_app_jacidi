import 'package:flutter/material.dart';
import 'package:prove_metro_app/models/activity.dart';

class ActivityListItem extends StatefulWidget {
  final Activity activity;
  const ActivityListItem({super.key, required this.activity});

  @override
  State<ActivityListItem> createState() => _ActivityListItemState();
}

class _ActivityListItemState extends State<ActivityListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Card(
        child: AspectRatio(
          aspectRatio: 3 / 2, // ancho / alto
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
    );
  }
}
