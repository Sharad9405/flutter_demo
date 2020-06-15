import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StartActivityForResult extends StatelessWidget {
  StartActivityForResult(int index);

  static const refUrl =
      'https://flutter.dev/docs/get-started/flutter-for/android-devs#what-is-the-equivalent-of-startactivityforresult';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StartActivityForResult() In Flutter",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          'StartActivityForResult() In Flutter',
          style: TextStyle(fontSize: 24.0),
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'The Navigator class handles routing in Flutter and is used to '
                            'get a result back from a route that you have pushed on the '
                            'stack.\n\nThis is done by awaiting on the Future returned by push()'
                            '\n\nFor example, to start a location route that lets the user select their '
                            'location, you could do the following:',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10.0),
                  child: Text(
                      "Map coordinates = await Navigator.of(context).pushNamed('/location');",
                    style: TextStyle(
                        fontSize: 14.0,
                      color: Colors.red
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10.0),
                  child: Text(
                    "And then, inside your location route, once the user has selected their location you can pop the stack with the result:",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 50.0),
                  child: Text(
                    "Navigator.of(context).pop({lat : 43.821757,long : -79.226392});",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.red
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
