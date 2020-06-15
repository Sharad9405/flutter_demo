import 'package:flutter/material.dart';

//void main() => runApp(StackAndPositionedWidget());


class StackAndPositionedWidget extends StatelessWidget {

  final int index;
  StackAndPositionedWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sample App",
          ),
        ),
        body: Center(
          child: Container(
              width: 400,
              height: 700,
              color: Colors.grey,
            child: Stack(
              alignment: Alignment.topRight,
//              fit: StackFit.loose,
//              fit: StackFit.expand,
//            overflow: Overflow.visible,
              children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    )
                  )

                ],
              ),
          ),

        ),

      ),
    );
  }
}

