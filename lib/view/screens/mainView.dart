import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  // ! START OF THE TREE
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
      appBar: buildAppBarDummie(),
      body: Container(
        color: myTheme.backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: buildFutureBuilderMainDummie(),
            ),
            SizedBox(height: deviceData.size.height * 0.10),
            buildRaisedButtonGET(deviceData),
            SizedBox(
              height: deviceData.size.height * 0.05,
            ),
            buildCurvedNavigationBarDummie(),
          ],
        ),
      ),
    );
  } // ! END OF THE TREE

  AppBar buildAppBarDummie() {
    return AppBar(
      title: Text("FACTS"),
      centerTitle: true,
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
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            child: Text(snapshot.data.number.toString()),
            color: Colors.orange,
            onPressed: () {},
          ),
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

  Widget buildRaisedButtonGET(MediaQueryData deviceData) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: myTheme.buttonColor,
      child: Text("GET"),
      onPressed: () {
        setState(() {});
      },
    );
  }

  Widget buildCurvedNavigationBarDummie() {
    return CurvedNavigationBar(
      backgroundColor: myTheme.backgroundColor,
      items: <Widget>[
        Icon(Icons.add, size: 30),
        Icon(Icons.list, size: 30),
        Icon(Icons.settings, size: 30),
      ],
      onTap: (index) {
        //Handle button tap
      },
    );
  }
}
