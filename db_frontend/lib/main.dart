import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const DevMateApp());
}

class DevMateApp extends StatelessWidget {
  const DevMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevMate AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}