import 'package:flutter/material.dart';

//void main() => runApp(TextWidget());

class TextWidget extends StatelessWidget {

  final int index;
  TextWidget(this.index);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sample App",
                style: TextStyle(
              fontSize: 20.0
          ),)
        ),
        body: Center(
          child: Column(
            children: <Widget>[
             Padding(
               padding: EdgeInsets.all(10.0),
               child: Text(
                 "import 'package:flutter/material.dart';\n",
                 style: TextStyle(
                   fontSize: 20.0
                 ),
               ),
             ),
              Text(
                "Hi This Is Sharad",
                style: new TextStyle(
                    color: Colors.red,
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.9,
                    wordSpacing: 1.0,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationStyle: TextDecorationStyle.dashed,
                    fontFamily: "Times New Roman"
//              backgroundColor: Colors.red,
//              background: Paint()..color = Colors.black..style = PaintingStyle.stroke,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
