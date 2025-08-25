import 'package:flutter/material.dart';
import 'package:prove_metro_app/globals/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/activities_provider.dart';


class UserActivitiesPage extends StatefulWidget {
  const UserActivitiesPage({super.key});

  @override
  State<UserActivitiesPage> createState() => _UserActivitiesPageState();
}

class _UserActivitiesPageState extends State<UserActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivitiesProvider>(context);
    final userActivities = provider.userActivities;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Mis Actividades",

      ),
      body: userActivities.isEmpty
          ? const Center(
        child: Text(
          "No estás inscrito en ninguna actividad",
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: userActivities.length,
        itemBuilder: (context, index) {
          final activity = userActivities[index];
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
              trailing: IconButton(
                icon: const Icon(Icons.cancel, color: Colors.red),
                onPressed: () {
                  provider.cancel(activity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Has cancelado la actividad ${activity.nombre}"),
                    ),
                  );
                },
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


