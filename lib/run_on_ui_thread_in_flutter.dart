import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class FutureAsyncAwaitUse extends StatelessWidget {

  FutureAsyncAwaitUse(int index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RunOnUiThread in Flutter',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      /*
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'RunOnUiThread in Flutter',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            ),
          ),
        ),
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: InkWell(
                child: Text(
                  refUrl,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.dashed),
                ),
                onTap: () async {
                  if (await canLaunch(refUrl)) {
                    await launch(refUrl);
                  }
                },
              ),
            ),
          ],
        ),
      ),

      */
      home: FutureExample(),

    );
  }
}

class FutureExample extends StatefulWidget {

  FutureExample({Key key}) : super(key: key);

  @override
  _FutureExampleState createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {

  static const refUrl =
      'https://flutter.dev/docs/get-started/flutter-for/android-devs#what-is-the-equivalent-of-runonuithread-in-flutter';

  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Future, Async, await',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
          ),
        ),
      ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              InkWell(
                child: Text(
                  refUrl,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.dashed),
                ),
                onTap: () async {
                  if (await canLaunch(refUrl)) {
                    await launch(refUrl);
                  }
                },
              ),
            new Flexible(
              child: Padding(
                  padding: EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widgets.length,
                    itemBuilder: (_, int pos) {
                      return getRow(pos);
                    },
                  ),
                ),

            ),
          ],
        )
    );
  }

  Widget getRow(int pos) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
          child: Text("${pos+1} " "  ${widgets[pos]["title"]}"),
        ),
      ),
    );
  }


  Future loadData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}

