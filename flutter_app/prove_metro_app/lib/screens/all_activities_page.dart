import 'package:flutter/material.dart';
import 'package:prove_metro_app/globals/custom_app_bar.dart';
import 'package:prove_metro_app/widgets/full_activity_list_item.dart';
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
      appBar: CustomAppBar(title: "TODAS LAS ACTIVIDADES", homeMode: true),
      body:
          activities.isEmpty
              ? const Center(
                child: Text(
                  "No hay actividades disponibles",
                  style: TextStyle(fontSize: 16),
                ),
              )
              : ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  final isEnrolled = provider.isEnrolled(activity);
                  final canEnroll = provider.canEnroll(activity);
                  print(activity.imagen);
                  return FullActivityListItem(
                    activity: activity,
                    isEnrolled: isEnrolled,
                    canEnroll: canEnroll,
                  );
                },
              ),
    );
  }
}
