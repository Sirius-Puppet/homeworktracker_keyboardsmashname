import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';
const Color _kAppColor = Color.fromARGB(255, 111, 253, 147);
const double _kSize = 100;
void main() {
  runApp(const HomeworkTrackerApp());
}

class HomeworkTrackerApp extends StatelessWidget {
  const HomeworkTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework Tracker',
      theme: ThemeData(canvasColor: _kAppColor, snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.blue, contentTextStyle: TextStyle(fontSize: 20,),),),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen())
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Homework Tracker',
          style: TextStyle(
            fontSize: 28,
            color: Colors.pink,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}