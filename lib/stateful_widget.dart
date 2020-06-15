import 'package:flutter/material.dart';

//void main() => runApp(StateFulWid());

class StateFulWid extends StatefulWidget {
  final int index;
  StateFulWid(this.index);

  @override
  _MyAppState createState() => _MyAppState(index);
}

class _MyAppState extends State<StateFulWid> {
  final int index;
  _MyAppState(this.index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      title: "Stateful",
      home: homePage(index),
    );
  }
}


class homePage extends StatefulWidget {
  var index;

  homePage(this.index);

//  get index => null;

  @override
  _homePageState createState() => _homePageState(index);
}

class _homePageState extends State<homePage> {
  var index;

  _homePageState(this.index);
//  var count =index;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AppBar"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
              child: Text(
                "$index",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            RaisedButton(
              onPressed: incrementCount,
              splashColor: Colors.blue,
              child: Text(
                "Click Me",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white
                ),
              ),
              color: Colors.cyan,
            )
          ],
        ),
      ),
    );
  }
  void incrementCount(){
    setState(() {
      index += 1;
    });
  }

}

