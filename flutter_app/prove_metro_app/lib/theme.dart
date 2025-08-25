import 'dart:ui';

import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF00A100);
final ThemeData CustomThemeData = ThemeData(

  fontFamily: 'CreatoDisplay', // Nombre que pusiste en pubspec.yaml
  textTheme: const TextTheme(
    titleLarge: TextStyle(letterSpacing: 1.5), // Espaciado mayor para títulos grandes
    titleMedium: TextStyle(letterSpacing: 1.2),
    titleSmall: TextStyle(letterSpacing: 1.0),

  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: const TextStyle(
      fontFamily: 'CreatoDisplay',
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
    ),
    unselectedLabelStyle: const TextStyle(
      fontFamily: 'CreatoDisplay',
      letterSpacing: 1.0,
    ),
  ),

);