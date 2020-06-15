import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HandleIncomingIntentData extends StatelessWidget {
  HandleIncomingIntentData(int index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Incoming Intent Data",
      theme: ThemeData(
          primarySwatch: Colors.cyan
      ),

      /*
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Handle Intent Data",
            style: TextStyle(
              fontSize: 20.0
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
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
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
      home: HandleIData(),

    );
  }
}

class HandleIData extends StatefulWidget {

  HandleIData({Key key}) : super(key: key);

  @override
  _HandleIDataState createState() => _HandleIDataState();
}

class _HandleIDataState extends State<HandleIData> {
  static const refUrl = "https://flutter.dev/docs/get-started/flutter-for/android-devs#how-do-i-handle-incoming-intents-from-external-applications-in-flutter";
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = "No Data";

  @override
  void initState() {
    super.initState();
    getSharedData();
  }

  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      body: Center(
        child: Text(
          dataShared
        ),
      ),
    );
    */
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Handle Intent Data",
          style: TextStyle(
              fontSize: 20.0
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
          Padding(
            padding:EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 50.0),
              child: Text(
                dataShared,
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
          ),


        ],
      ),
    );
  }

  void getSharedData() async {
    var sharedData = await platform.invokeMapMethod("getSharedData");
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData as String;
      });
    }
  }
}

