import 'package:flutter/material.dart';
import 'package:prove_metro_app/globals/custom_app_bar.dart';
import 'package:prove_metro_app/widgets/activity_list_item.dart';
import 'package:prove_metro_app/widgets/activity_list_item_small.dart';
import 'package:provider/provider.dart';
import '../../providers/activities_provider.dart';
import '../widgets/bannerWidget.dart';
/**
 * VALIDADO POR MI
 * * Si el usuario no está inscrito en ninguna actividad, muestra un mensaje "No estás inscrito en ninguna actividad".
 * * Si el usuario está inscrito en actividades, las muestra en una lista o cuadrícula según la selección del usuario.
 * * * El usuario puede cambiar entre vista de lista y vista de cuadrícula usando los botones en la parte superior derecha.
 * * * En vista de lista, cada actividad se muestra con su imagen, nombre, día y hora, y un botón para ver más detalles.
 * */
class UserActivitiesPage extends StatefulWidget {
  const UserActivitiesPage({super.key});

  @override
  State<UserActivitiesPage> createState() => _UserActivitiesPageState();
}

class _UserActivitiesPageState extends State<UserActivitiesPage> {
  bool isGridView = false; // Estado para controlar la vista

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivitiesProvider>(context);
    final userActivities = provider.userActivities;

    return Scaffold(
      appBar: CustomAppBar(title: "MIS ACTIVIDADES", homeMode: true),
      body: Column(
        children: [
          const BannerWidget(), // <-- Agregamos el banner aquí

          // Widget para cambiar de vista
          Row(
            children: [
              // Padding solo al texto
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // espacio desde el borde
                child: FutureBuilder<String>(
                  future: provider.getUserName(), // Llama a la función asíncrona
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text("Cargando entrenador...");
                    return Text(
                      "Hola, ${snapshot.data}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),

              const Spacer(), // Empuja los botones de vista a la derecha

              IconButton(
                icon: Icon(
                  Icons.list,
                  color: !isGridView ? Colors.black : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isGridView = false;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.grid_view,
                  color: isGridView ? Colors.black : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isGridView = true;
                  });
                },
              ),
            ],
          ),

          // Mostrar lista o cuadrícula
          Expanded(
            child: userActivities.isEmpty
                ? const Center(
              child: Text(
                "No estás inscrito en ninguna actividad",
                style: TextStyle(fontSize: 16),
              ),
            )
                : isGridView
                ? GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2, // dos columnas
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 0.55, // <1 aumenta la altura, >1 la reduce

              ),

              itemCount: userActivities.length,
              itemBuilder: (context, index) {
                final activity = userActivities[index];
                return ActivityListItemSmall(activity: activity);
              },
            )
                : SingleChildScrollView(
              child: Column(
                children: userActivities
                    .map(
                      (activity) =>
                          ActivityListItem(activity: activity),
                )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
