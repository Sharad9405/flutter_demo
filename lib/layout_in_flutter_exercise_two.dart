import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutInFlutterExerciseTwo extends StatelessWidget {
  LayoutInFlutterExerciseTwo(int index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Layout Tutorial',
        theme: ThemeData(primarySwatch: Colors.green),
        home: Exercise());
  }
}

class Exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'Layout Tutorial',
//          style: TextStyle(fontSize: 30.0, color: Colors.white),
//        ),
//      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/strawberry.jpg',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  children: [
                    Expanded(
                      /*1*/
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*2*/
                          Container(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              'Oeschinen Lake Campground',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Kandersteg, Switzerland',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    Icon(
                      Icons.star,
                      color: Colors.red[500],
                    ),
                    Text('41'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
                    _buildButtonColumn(Colors.blue, Icons.near_me, 'NEAR MY'),
                    _buildButtonColumn(Colors.blue, Icons.share, 'SHARE')
                  ],
                ),
              ),
              Container(
                child: descriptionText,
              ),

            ],
          ),
//              ],
//            ),
        ),
      ),
    );
  }

  Widget descriptionText = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
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


