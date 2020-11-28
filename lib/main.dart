import 'package:flutter/material.dart';
import 'package:number_facts/view/screens/mainView.dart';

import 'constants/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: MainView(),
    );
  }
}
