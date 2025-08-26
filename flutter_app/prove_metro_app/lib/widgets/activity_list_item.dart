import 'package:flutter/material.dart';
import 'package:prove_metro_app/models/activity.dart';
import 'package:prove_metro_app/pages/activity/DetailsPage.dart';
import 'package:prove_metro_app/widgets/MinimalButton.dart';
import 'package:provider/provider.dart';
import '../providers/activities_provider.dart';
import 'package:intl/intl.dart';
//import utils/functions.dart
import '../utils/functions.dart';

class ActivityListItem extends StatefulWidget {
  final Activity activity;
  const ActivityListItem({super.key, required this.activity});

  @override
  State<ActivityListItem> createState() => _ActivityListItemState();
}

class _ActivityListItemState extends State<ActivityListItem> {
  @override
  Widget build(BuildContext context) {
    print(widget.activity.toJson());
    final provider = context.watch<ActivitiesProvider>(); // escucha cambios
    final isEnrolled = provider.isEnrolled(widget.activity);

    // Formato de fecha y hora
    final String diaHora = formatDayTime(widget.activity);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => Detailspage(activity: widget.activity),
          ),
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

            // Espaciado interno
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre de la actividad
                  Text(
                    widget.activity.nombre,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),

                  const SizedBox(height: 6),

                  // Descripción de la actividad
                  Text(
                    widget.activity.descripcion,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 12),

                  // Botón de inscripción/cancelación
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            diaHora,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: MinimalButton(
                          isSelected: isEnrolled, // true si ya está inscrito
                          selectedText: "CANCELAR",
                          unselectedText: "INSCRIBIRSE",
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          onSelected: () {
                            // Este se llama cuando NO está inscrito y se presiona
                            provider.enroll(widget.activity);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Te has inscrito en ${widget.activity.nombre}"),
                              ),
                            );
                          },
                          onUnselected: () {
                            // Este se llama cuando está inscrito y se presiona
                            provider.cancel(widget.activity);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Has cancelado la actividad ${widget.activity.nombre}"),
                              ),
                            );
                          },
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
