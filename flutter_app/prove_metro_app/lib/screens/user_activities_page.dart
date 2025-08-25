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
          //print('se carga la imagen: ${activity.imagen}');
          return ActivityListItem(activity: activity);
        },
      ),
    );
  }
}


