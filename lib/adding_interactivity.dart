import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddingInteractivity2 extends StatelessWidget {
  AddingInteractivity2(int index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Layout Tutorial',
        theme: ThemeData(primarySwatch: Colors.green),
        home: FavoriteWidget());
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool _isFavorited = true;
  int _favoriteCount = 41;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child:    Row(
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

                    Container(
                      padding: EdgeInsets.all(0),
                      child: IconButton(
                        icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
                        color: Colors.red[500],
                        onPressed: _addRemoveFavorite(),
                      ),
                    ),

                    SizedBox(
                      width: 18,
                      child: Container(
                        child: Text('$_favoriteCount'),
                      ),
                    )
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

  _addRemoveFavorite() {


  }


}


