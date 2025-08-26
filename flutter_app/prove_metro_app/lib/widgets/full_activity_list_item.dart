import 'package:flutter/material.dart';
import 'package:prove_metro_app/models/activity.dart';

import '../pages/activity/DetailsPage.dart';
import '../utils/functions.dart';
import 'package:provider/provider.dart';
import '../../providers/activities_provider.dart';
import 'MinimalButton.dart';

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
    final provider = Provider.of<ActivitiesProvider>(context);
    bool canEnroll = provider.canEnroll(widget.activity);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (context) => const Detailspage()),
        );
      },
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      widget.activity.imagen,
                      fit: BoxFit.cover,
                      width: double.infinity,
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

                  // 👇 Badge en la esquina superior derecha
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: widget.activity.sociosInscritos.contains(provider.userId)
                            ? Colors.green
                            : canEnroll
                            ? Colors.black
                            : Colors.red,

                      ),
                      child: Text(
                        widget.activity.sociosInscritos.contains(provider.userId)
                            ? "INSCRITO"
                            : provider.canEnroll(widget.activity)
                            ? "PLAZAS DISPONIBLES"
                            : "HORARIO OCUPADO",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Imagen
            Container(
              child: Text(
                widget.activity.nombre,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                maxLines: 4,
                widget.activity.descripcion,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule, size: 16, color: Colors.black),
                    const SizedBox(width: 4),
                    Text(
                      formatDayTime(widget.activity),
                      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                //trsiner
                const SizedBox(height: 4),
                FutureBuilder<String>(
                  future: provider.getTrainerName(widget.activity.entrenadorId),
                  builder: (context, snapshot) {

                    if (!snapshot.hasData) return const Text("Cargando entrenador...");
                    return Text("Entrenador: ${snapshot.data}", style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerRight,
              child: MinimalButton(
                isSelected: widget.activity.sociosInscritos.contains(provider.userId),
                selectedText: "CANCELAR",
                unselectedText: "INSCRIBIRSE",
                selectedBackground: Colors.black,
                unselectedBackground: canEnroll ? Colors.white : Colors.grey.shade300,
                selectedTextColor: Colors.white,
                unselectedTextColor: Colors.black,
                onSelected: () {
                  if (canEnroll) {
                    provider.enroll(widget.activity); // Método para inscribirse
                    setState(() {}); // Actualiza badge y botón
                  }else{
                    // Mostrar mensaje de error
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No puedes inscribirte en esta actividad: ya tienes otra programada a esta hora."),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                onUnselected: () {
                  provider.cancel(widget.activity); // Método para cancelar inscripción
                  setState(() {}); // Actualiza badge y botón
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
