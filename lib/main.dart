import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodin/firebase_options.dart';
import 'package:foodin/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const FoodIn());
}

class FoodIn extends StatelessWidget {
  const FoodIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodIn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}