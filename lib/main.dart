import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:number_facts/view/screens/mainView.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context),
      home: AnimatedSplashScreen(
        animationDuration: Duration(seconds: 2),
        splash: 'assets/facts.png',
        duration: 3000,
        nextScreen: MainView(),
        splashTransition: SplashTransition.rotationTransition,
      ),
    );
  }
}
