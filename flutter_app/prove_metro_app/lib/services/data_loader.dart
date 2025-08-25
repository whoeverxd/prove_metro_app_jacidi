import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/activity.dart';
import '../models/member.dart';
import '../models/trainer.dart';

// Cargar todas las actividades
Future<List<Activity>> loadActivities() async {
  final String response =
  await rootBundle.loadString('resources/response_calls/list_activities.json');
  final data = json.decode(response) as List;
  return data.map((json) => Activity.fromJson(json)).toList();
}

// Cargar miembros
Future<List<Member>> loadMembers() async {
  final String response =
  await rootBundle.loadString('resources/response_calls/list_members.json');
  final data = json.decode(response) as List;
  return data.map((json) => Member.fromJson(json)).toList();
}

// Cargar entrenadores
Future<List<Trainer>> loadTrainers() async {
  final String response =
  await rootBundle.loadString('resources/response_calls/list_trainers.json');
  final data = json.decode(response) as List;
  return data.map((json) => Trainer.fromJson(json)).toList();
}
