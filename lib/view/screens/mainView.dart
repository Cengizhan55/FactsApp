import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:number_facts/core/facts.dart';
import 'package:number_facts/services/facts_service.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // ! START OF THE TREE
  @override
  void initState() {
    super.initState();
  }

  final _factsResponseService = FactsResponseService();

  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
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
          ],
        ),
      ),
    );
  } // ! END OF THE TREE

  FutureBuilder<Facts> buildFutureBuilderMainDummie() {
    return FutureBuilder<Facts>(
      future: _factsResponseService.getData(),
      builder: (context, snapshot) {
        AsyncSnapshot<Facts> myFacts = snapshot;
        switch (myFacts.connectionState) {
          case ConnectionState.waiting:
            return buildCircularProgressDummie(context);

          case ConnectionState.none:
            return buildErrorMessageDummie(myFacts);
          case ConnectionState.done:
            return buildCenterTextScreenDummie(myFacts, context);

          case ConnectionState.active:
            return Center(
              child: Text("its active"),
            );
        }
      },
    );
  }

  Center buildErrorMessageDummie(AsyncSnapshot<Facts> snapshot) {
    return Center(
      child: Text(
        'Hata: ${snapshot.error}',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Center buildCircularProgressDummie(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading..',
            style: TextStyle(color: Colors.cyan, fontSize: 20),
          ),
          SizedBox(
            height: 50,
          ),
          CircularStepProgressIndicator(
            totalSteps: 20,
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.1,
            gradientColor: LinearGradient(
              colors: [Colors.black, Colors.cyan],
            ),
          ),
        ],
      ),
    );
  }

  Center buildCenterTextScreenDummie(
      AsyncSnapshot<Facts> snapshot, BuildContext context) {
    List<String> myList = [snapshot.error];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TyperAnimatedTextKit(
                      speed: Duration(milliseconds: 20),
                      isRepeatingAnimation: false,
                      text: snapshot.hasData ? [snapshot.data.text] : myList,
                      textStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                ),
              ),
            ),
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }

  Widget buildRaisedButtonGET(
    MediaQueryData deviceData,
  ) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      color: Colors.grey,
      child: Text(
        "GET A RANDOM FACT",
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
}
