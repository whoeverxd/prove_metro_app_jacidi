import 'package:flutter/material.dart';
import 'package:prove_metro_app/globals/custom_app_bar.dart';
import 'package:prove_metro_app/models/activity.dart';
import 'package:provider/provider.dart';
import '../../providers/activities_provider.dart';
import '../../utils/functions.dart';
import '../../widgets/MinimalButton.dart';
import 'FullScreenImagePage.dart';

class Detailspage extends StatelessWidget {
  final Activity activity;

  const Detailspage({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivitiesProvider>(context);

    final bool isEnrolled = activity.sociosInscritos.contains(provider.userId);
    final bool canEnroll = provider.canEnroll(activity);
    return Scaffold(
      appBar: CustomAppBar(title: 'DETALLES DE LA ACTIVIDAD'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen principal con opción de ver en pantalla completa
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => FullScreenImagePage(imagePath: activity.imagen),
                  ),
                );
              },
              child: Stack(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      activity.imagen,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 220,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(
                            Icons.fitness_center,
                            size: 100,
                            color: Colors.red,
                          ),
                    ),
                  ),

                  // 🔍 Icono flotante arriba a la derecha
                  Positioned(
                    top: 12,
                    right: 12,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: const Icon(Icons.fullscreen, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Nombre de la actividad
            Center(
              child: Text(
                activity.nombre,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Descripción completa (sin cortar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                activity.descripcion,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ),

            const SizedBox(height: 20),

            // Entrenador + Horario
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.person, color: Colors.black54),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FutureBuilder<String>(
                      future: provider.getTrainerName(activity.entrenadorId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text("Cargando entrenador...");
                        }
                        return Text(
                          snapshot.data!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.schedule, color: Colors.black54),
                  const SizedBox(width: 8),
                  Text(
                    formatDayTime(activity),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Botón de inscripción/cancelación
            Center(
              child: MinimalButton(
                isSelected: isEnrolled,
                selectedText: "CANCELAR",
                unselectedText: "INSCRIBIRSE",
                selectedBackground: Colors.black,
                unselectedBackground: canEnroll ? Colors.white : Colors.grey.shade300,
                selectedTextColor: Colors.white,
                unselectedTextColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                showBorder: true,
                onSelected: () {
                  if (canEnroll) {
                    provider.enroll(activity);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "No puedes inscribirte en esta actividad: ya tienes otra programada a esta hora."
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                onUnselected: () {
                  provider.cancel(activity);
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
