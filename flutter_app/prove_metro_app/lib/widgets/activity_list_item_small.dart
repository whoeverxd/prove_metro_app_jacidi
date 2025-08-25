import 'package:flutter/material.dart';
import 'package:prove_metro_app/models/activity.dart';
import 'package:prove_metro_app/widgets/MinimalButton.dart';
import 'package:provider/provider.dart';

import '../providers/activities_provider.dart';

class ActivityListItemSmall extends StatefulWidget {
  final Activity activity;
  const ActivityListItemSmall({super.key, required this.activity});

  @override
  State<ActivityListItemSmall> createState() => _ActivityListItemState();
}

class _ActivityListItemState extends State<ActivityListItemSmall> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ActivitiesProvider>(); // escucha cambios
    final isEnrolled = provider.isEnrolled(widget.activity);
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.white, // fondo blanco
        elevation: 0, // quita la sombra
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // esquinas cuadradas
        ),

        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1, // ancho / alto
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
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                maxLines: 1,
                widget.activity.nombre,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            SizedBox(height: 8),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(widget.activity.descripcion,
                maxLines: 3,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SizedBox(height: 8),
           Container(
              alignment: Alignment.centerRight,
              child: MinimalButton(
                isSelected: true, // ya inscrito
                selectedText: "CANCELAR",
                unselectedText: "INSCRIBIRSE",
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // más compacto

                onUnselected: () {
                  provider.cancel(widget.activity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Has cancelado la actividad ${widget.activity.nombre}")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
