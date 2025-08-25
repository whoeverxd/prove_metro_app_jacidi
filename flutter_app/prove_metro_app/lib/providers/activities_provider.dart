import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../models/trainer.dart';
import '../services/data_loader.dart';

class ActivitiesProvider extends ChangeNotifier {
  List<Activity> _allActivities = [];
  List<Activity> _userActivities = [];
  final int userId;

  ActivitiesProvider({required this.userId});

  List<Activity> get allActivities => _allActivities;
  List<Activity> get userActivities => _userActivities;

  Future<void> loadData() async {
    print('Loading activities for user $userId');
    _allActivities = await loadActivities(); // desde JSON
    _userActivities = _allActivities.where((a) => a.sociosInscritos.contains(userId)).toList();


    notifyListeners();
  }

  void enroll(Activity activity) {
    if (!_userActivities.contains(activity)) {
      activity.sociosInscritos.add(userId);
      _userActivities.add(activity);
      notifyListeners();
    }
  }

  void cancel(Activity activity) {
    activity.sociosInscritos.remove(userId);
    _userActivities.removeWhere((a) => a.id == activity.id);
    notifyListeners();
  }

  bool isEnrolled(Activity activity) => _userActivities.any((a) => a.id == activity.id);

  bool canEnroll(Activity activity) {
    // No permitir inscribirse a clases con mismo día y hora
    return !_userActivities.any((a) => a.dia == activity.dia && a.hora == activity.hora);
  }

  Future<String>? getTrainerName(int entrenadorId) async {

    final trainers = await loadTrainers();
    final trainer = trainers.firstWhere((t) => t.id == entrenadorId, orElse: () => Trainer(id: 0, nombre: 'Desconocido', apellidos: '', dni: '', cv: '', actividades: [],));
    return trainer.nombre;
  }
}