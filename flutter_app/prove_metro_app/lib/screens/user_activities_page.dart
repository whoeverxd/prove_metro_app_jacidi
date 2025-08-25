import 'package:flutter/material.dart';
import 'package:prove_metro_app/globals/custom_app_bar.dart';
import 'package:prove_metro_app/widgets/activity_list_item.dart';
import 'package:provider/provider.dart';
import '../../providers/activities_provider.dart';

class UserActivitiesPage extends StatefulWidget {
  const UserActivitiesPage({super.key});

  @override
  State<UserActivitiesPage> createState() => _UserActivitiesPageState();
}

class _UserActivitiesPageState extends State<UserActivitiesPage> {
  bool isGridView = false; // 1. Estado para controlar la vista

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivitiesProvider>(context);
    final userActivities = provider.userActivities;

    return Scaffold(
      appBar: CustomAppBar(title: "Mis Actividades"),
      body: Column(
        children: [
          // 2. Widget para cambiar de vista
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
          ),
          // 3. Mostrar lista o cuadrícula
          Expanded(
            child:
                userActivities.isEmpty
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
                            childAspectRatio: 3 / 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                      itemCount: userActivities.length,
                      itemBuilder: (context, index) {
                        final activity = userActivities[index];
                        return ActivityListItem(activity: activity);
                      },
                    )
                    : ListView.builder(
                      itemCount: userActivities.length,
                      itemBuilder: (context, index) {
                        final activity = userActivities[index];
                        return ActivityListItem(activity: activity);
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
