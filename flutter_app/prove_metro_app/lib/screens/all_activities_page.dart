import 'package:flutter/material.dart';
import 'package:prove_metro_app/globals/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/activities_provider.dart';


class AllActivitiesPage extends StatefulWidget {
  const AllActivitiesPage({super.key});

  @override
  State<AllActivitiesPage> createState() => _AllActivitiesPageState();
}
/*
* PRUEBAS VALIDADAS POR MI
* Si no hay actividades, muestra un mensaje "No hay actividades".
* Si hay actividades, las muestra en una lista.
* */
class _AllActivitiesPageState extends State<AllActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivitiesProvider>(context);
    final activities = provider.allActivities;

    return Scaffold(
      appBar: CustomAppBar(
        title: "TODAS LAS ACTIVIDADES",
      ),
      body: activities.isEmpty
          ? const Center(child: Text("No hay actividades disponibles", style: TextStyle(fontSize: 16)))
          : ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          final isEnrolled = provider.isEnrolled(activity);
          final canEnroll = provider.canEnroll(activity);
          print(activity.imagen);
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: SizedBox(
                width: 60,
                child: Image.asset(
                  activity.imagen,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                  const Icon(Icons.fitness_center),
                ),
              ),
              title: Text(activity.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${activity.dia} • ${activity.hora}"),
                  const SizedBox(height: 4),
                  Text(
                    activity.descripcion,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  FutureBuilder<String>(
                    future: provider.getTrainerName(activity.entrenadorId),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Text("Cargando entrenador...");
                      return Text("Entrenador: ${snapshot.data}");
                    },
                  ),
                ],
              ),
              trailing: isEnrolled
                  ? IconButton(
                icon: const Icon(Icons.cancel, color: Colors.red),
                onPressed: () {
                  provider.cancel(activity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Has cancelado ${activity.nombre}"),
                    ),
                  );
                },
              )
                  : IconButton(
                icon: const Icon(Icons.add, color: Colors.green),
                onPressed: canEnroll
                    ? () {
                  provider.enroll(activity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Te has inscrito en ${activity.nombre}"),
                    ),
                  );
                }
                    : null, // deshabilitado si hay conflicto de horario
              ),
              onTap: () {
                // Aquí podrías abrir un detalle completo de la actividad
              },
            ),
          );
        },
      ),
    );
  }
}
