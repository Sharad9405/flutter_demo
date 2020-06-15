import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeAppTest extends StatelessWidget {
  FadeAppTest(int index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fade App Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyFadeTest(title: 'Fade Demo'),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key : key);

  final String title;


  @override
  _MyFadeTestState createState() => _MyFadeTestState();
}

class _MyFadeTestState extends State<MyFadeTest> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;


  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(microseconds: 20000),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: controller, curve: Curves.fastOutSlowIn
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title
        ),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(
              size: 200.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.forward();
        },
        tooltip: 'Fade',
        child: Icon(Icons.brush),
      ),
    );
  }
}
