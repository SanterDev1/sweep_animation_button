
// ignore_for_file: avoid_print
import 'package:example/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweep_animation_button/sweep_animation_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget()
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SweepAnimationButton(
          width: 250,
          height: 50,
          animationProgressColor: Colors.green[800],
          borderRadius: 50,
          animationColor: Colors.lightGreen,
          backroundColor: Colors.lightGreen[100],
          durationCircle: 5,
          hideIcon: true,
          child: Text("Sweeped Button",
            style: TextStyle(
              fontSize: 15, 
              color: Colors.green[800],
              fontWeight: FontWeight.w500, 
              letterSpacing: 1,
            ),
          ),
          onTap: () {
            print("Exemple");
          },
        ),
      ),
    );
  }
}