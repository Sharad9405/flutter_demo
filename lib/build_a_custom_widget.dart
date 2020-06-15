import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:async/async.dart';

class CustomButton extends StatelessWidget {
  final int index;

  CustomButton(this.index);

  final String refUrl =
      "https://flutter.dev/docs/get-started/flutter-for/android-devs#how-do-i-build-custom-widgets";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Build A Custom Widget",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Build A Custom Widget",
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /*
            GestureDetector(
                child: Text(
                    refUrl,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue
                    )
                ),
                onTap: () async {
                    if(await canLaunch(refUrl)){
                      await launch(refUrl);
                    }
                }
            )
            */
            Padding(
              padding: EdgeInsets.all(20.0),
              child: InkWell(
                child: Text(
                  refUrl,
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                onTap: () async {
                  if (await canLaunch(refUrl)) {
                    await launch(refUrl);
                  }
                },
              ),
            ),
            Center(
              child: CreateCustomButton("Custom Button"),
            )

          ],
        ),
      ),
    );
  }
}

class CreateCustomButton extends StatelessWidget {
  final String label;

  CreateCustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}
