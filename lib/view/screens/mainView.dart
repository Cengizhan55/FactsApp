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

  final _factsResponseService = FactsResponseService();

  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/real_galaxy.jpg",
          ),
        )),
        child: Column(
          children: [
            SizedBox(height: deviceData.size.height * 0.2),
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
      backgroundColor: Colors.orange[900],
      title: Text("FACTS"),
      centerTitle: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
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
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white70,
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
      color: Colors.grey,
      child: Text(
        "GET RANDOM FACT",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      onPressed: () {
        setState(() {});
      },
    );
  }

  Widget buildCurvedNavigationBarDummie() {
    return CurvedNavigationBar(
      color: Colors.black38,
      backgroundColor: Colors.black45,
      items: <Widget>[
        Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.list,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.settings,
          size: 30,
          color: Colors.white,
        ),
      ],
      onTap: (index) {
        //Handle button tap
      },
    );
  }
}
