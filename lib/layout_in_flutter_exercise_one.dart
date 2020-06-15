import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutInFlutterExerciseOne extends StatelessWidget {
  LayoutInFlutterExerciseOne(int index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Layout In Flutter Exercise 1",
        theme: ThemeData(primarySwatch: Colors.green),
        home: Exercise());
  }
}

class Exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Layout In Flutter Exercise 1',
          style: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 250,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
//              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//                Container(
//                  width: 200,
//                  child: leftColumn
//                  ),
              Padding(
                padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Strawberry Pavlova',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pavlova is meringue-based desert\nnamed after the Russian ballerina'
                            '\nAnna Pavlova. Pavlova features a crips,\ncrust and soft, light inside,'
                            '\ntopped with fruit and whiped cream.'
                      ),
                      Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                        child : Row(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.star, color: Colors.green[500]),
                                Icon(Icons.star, color: Colors.green[500]),
                                Icon(Icons.star, color: Colors.green[500]),
                                Icon(Icons.star, color: Colors.black),
                                Icon(Icons.star, color: Colors.black),
                              ],
                            ),

                            Text(
                              '170 Reviews',
                              style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Roboto',
                              letterSpacing: 0.5,
                              fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),

                      DefaultTextStyle.merge(
                        style: descTextStyle,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Icon(Icons.kitchen, color: Colors.green[500]),
                                    Text('PREP:'),
                                    Text('25 min'),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                children: [
                                  Icon(Icons.timer, color: Colors.green[500]),
                                  Text('COOK:'),
                                  Text('1 hr'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child:Column(
                                children: [
                                  Icon(Icons.restaurant, color: Colors.green[500]),
                                  Text('FEEDS:'),
                                  Text('4-6'),
                                ],
                              ),
                            ),
                            ],
                          ),
                      ),
                  ],
                ),
              ),

              Expanded(
                child: Image.asset(
                  'assets/images/strawberry.jpg',
                  fit: BoxFit.cover,
                ),
              ),
        ],
      ),
    ),)
    ,
    )
    ,
    /* body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[

              ],
            ),
            Expanded(
              child: Image.asset(
                'assets/images/strawberry.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),*/
    );
  }

  static var mainImage = Expanded(
    child: Image.asset(
      'assets/images/strawberry.jpg',
      fit: BoxFit.cover,
    ),
  );

  static var stars = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.black),
      Icon(Icons.star, color: Colors.black),
    ],
  );
  static final ratings = Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        stars,
        Text(
          '170 Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );

  static final descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 15,
    height: 2,
  );

  // DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
  static final iconList = DefaultTextStyle.merge(
    style: descTextStyle,
    child: Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.kitchen, color: Colors.green[500]),
              Text('PREP:'),
              Text('25 min'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.timer, color: Colors.green[500]),
              Text('COOK:'),
              Text('1 hr'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.restaurant, color: Colors.green[500]),
              Text('FEEDS:'),
              Text('4-6'),
            ],
          ),
        ],
      ),
    ),
  );

  final leftColumn = Container(
    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
    child: Column(
      children: [
        titleText,
        subTitle,
        ratings,
        iconList,
      ],
    ),
  );

  static final titleText = Text(
    'Strawberry Pavlova',
    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
  );
  static final subTitle = Text(
      'Pavlova is meringue-based desert named after the Russian ballerina'
          ' Anna Pavlova. Pavlova features a crips, crust and soft, light inside,'
          ' topped with fruit and whiped cream.');
}
