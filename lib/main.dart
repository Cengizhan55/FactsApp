import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_facts/view/screens/mainView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String SPLASH_IMAGE_DIRECTORY = 'assets/facts.png';
    return MaterialApp(
      
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Theme.of(context),
      home: AnimatedSplashScreen(
        animationDuration: Duration(seconds: 1),
        splash: SPLASH_IMAGE_DIRECTORY,
        duration: 3000,
        nextScreen: MainView(),
        splashTransition: SplashTransition.sizeTransition,
      ),
    );
  }
}
