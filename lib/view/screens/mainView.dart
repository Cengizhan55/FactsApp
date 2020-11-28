import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:number_facts/constants/custom_theme.dart';
import 'package:number_facts/core/facts.dart';
import 'package:number_facts/services/facts_service.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    FactsResponseService _factsResponseService;
    super.initState();
  }

  @override
  final _factsResponseService = FactsResponseService();

  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("FACTS"),
        centerTitle: true,
      ),
      body: Container(
        color: myTheme.backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(35),
          child: Column(
            children: [
              Expanded(
                child: buildFutureBuilderMainDummie(),
              ),
              SizedBox(height: deviceData.size.height * 0.10),
              buildFlatButtonGET(deviceData),
              SizedBox(
                height: deviceData.size.height * 0.05,
              ),
              buildBottomNavigationBarDummie(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<Facts> buildFutureBuilderMainDummie() {
    return FutureBuilder<Facts>(
      future: _factsResponseService.getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Veriler yükleniyor...'),
                  SizedBox(
                    height: 50,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
            break;
          default:
            if (snapshot.hasError)
              return Center(
                child: Text('Hata: ${snapshot.error}'),
              );
            else
              return buildCenterTextScreenDummie(snapshot);
        }
      },
    );
  }

  Center buildCenterTextScreenDummie(AsyncSnapshot<Facts> snapshot) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: TyperAnimatedTextKit(
                    isRepeatingAnimation: false,
                    text: [snapshot.data.text],
                    textStyle: TextStyle(
                      fontSize: 30.0,
                    ),
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
            ),
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }

  Widget buildFlatButtonGET(MediaQueryData deviceData) {
    return FlatButton(
      height: deviceData.size.height * 0.10,
      minWidth: deviceData.size.width * 0.2,
      shape: myTheme.inputDecorationTheme.border,
      color: myTheme.buttonColor,
      child: Text("GET"),
      onPressed: () {
        setState(() {});
      },
    );
  }

  Widget buildBottomNavigationBarDummie() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.icecream),
          label: "asdas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.icecream),
          label: "asdas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.icecream),
          label: "asdas",
        ),
      ],
    );
  }
}
