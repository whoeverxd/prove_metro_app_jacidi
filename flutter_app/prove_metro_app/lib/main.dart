import 'package:flutter/material.dart';
import 'package:prove_metro_app/theme.dart';
import 'package:provider/provider.dart';

// Importa tus providers y pantallas
import 'screens/all_activities_page.dart';
import 'screens/user_activities_page.dart';
import 'providers/activities_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ActivitiesProvider(userId: 1)..loadData(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jacidi Gym',
      theme:CustomThemeData,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const UserActivitiesPage(),
    const AllActivitiesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'MIS ACTIVIDADES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'TODAS',



          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
