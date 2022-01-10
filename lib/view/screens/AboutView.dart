import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_facts/view/screens/mainView.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AboutView extends StatefulWidget {
  AboutView({key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  String name = "Cengizhan";
  int _currentindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.black,
        child: Container(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.verified_user,
                    color: Colors.red,
                  ),
                  title: Text(
                    "API copyrights",
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Text("www.numbersapi.com/",
                      style: TextStyle(color: Colors.green)),
                ),
                ListTile(
                  leading: Icon(
                    Icons.functions,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Used methods",
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Text(
                    "HTTP - JSON",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.create,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Creators",
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Text(
                    "Students of Ege University",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.class_,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Section Info",
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Text(
                    "Mobile Programming",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
            color: Colors.black),
      ),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
      ),
      body: myBodyWidget(name), //! Body Widget
      bottomNavigationBar: SalomonBottomBar(
        unselectedItemColor: Colors.black,
        currentIndex: _currentindex,
        onTap: (i) => setState(() {
          _currentindex = i;
          if (_currentindex == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => MainView(),
              ),
            );
          }
          if (_currentindex == 2) {
            SystemNavigator.pop();
          }
        }),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.red,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.fiber_new_sharp),
            title: Text("Daily"),
            selectedColor: Colors.red,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.exit_to_app_sharp),
            title: Text("Exit"),
            selectedColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

class myBodyWidget extends StatelessWidget {
  const myBodyWidget(
    String name, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "DAILY FACTS",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w700, fontSize: 35),
            ),
          ),
          myListWidget("Einstein was barely talking until he is 9."),
          myListWidget(
              "An ant can lift things even 50 times heavier than his body weight"),
          myListWidget(
              "A shark is the only known fish that can blink with both eyes."),
          myListWidget("Most people fall asleep in seven minutes."),
          myListWidget(
              "A shark is the only known fish that can blink with both eyes."),
          myListWidget("Rubber bands last longer when refrigerated."),
          myListWidget("If you sneeze too hard, you could fracture a rib."),
          myListWidget("A shrimp's heart is in its head."),
          myListWidget("A crocodile cannot stick its tongue out."),
          myListWidget(
              "It is impossible for most people to lick their own elbow."),
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class myListWidget extends StatelessWidget {
  myListWidget(this.s);

  final String s;
  @override
  Widget build(BuildContext context) {
    String string = this.s;
    return ListTile(
      leading: Icon(
        Icons.done_outline_rounded,
        color: Colors.red,
      ),
      title: Text(string,
          style: TextStyle(
            color: Colors.white,
          )),
    );
  }
}
