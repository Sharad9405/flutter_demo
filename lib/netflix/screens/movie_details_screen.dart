import 'package:flutter/material.dart';
import 'package:flutter_app/netflix/widgets/circular_clipper.dart';
import 'package:flutter_app/netflix/widgets/content_scroll.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Stack(
            children: <Widget>[
              curvedImage(),
              actionBar(),
              playPauseAnchorButton(),
              addToMyListWidget(),
              shareWidget(),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'THE NUTCRACKER AND THE FOUR REALMS',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Adventure. Family. Fantasy',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 12.0,),
                rattingBar(),
               Padding(
                 padding: EdgeInsets.only(left: 20.0,top: 20.0, right: 20.0),
                 child:  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     Column(
                       children: <Widget>[
                         Text(
                           'Year',
                           style: TextStyle(
                             color: Colors.black54,
                             fontSize: 16.0,
                           ),
                         ),
                         SizedBox(height: 2.0),
                         Text(
                           '2019',
                           style: TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ],
                     ),
                     Column(
                       children: <Widget>[
                         Text(
                           'Country',
                           style: TextStyle(
                             color: Colors.black54,
                             fontSize: 16.0,
                           ),
                         ),
                         SizedBox(height: 2.0),
                         Text(
                           'USA',
                           style: TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ],
                     ),
                     Column(
                       children: <Widget>[
                         Text(
                           'Length',
                           style: TextStyle(
                             color: Colors.black54,
                             fontSize: 16.0,
                           ),
                         ),
                         SizedBox(height: 2.0),
                         Text(
                           '125 min',
                           style: TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
                SizedBox(height: 25.0),
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                    child: Text(
                      'All Clara wants is a key - a one-of-a-kind key that will'
                          ' unlock a box that holds a priceless gift from her '
                          'late mother. A golden thread, presented to her at'
                          ' godfather Drosselmeyer\'s annual holiday party, '
                          'leads her to the coveted key-which promptly'
                          ' disappears into a strange and mysterious parallel'
                          ' world. It\'s there that Clara encounters a soldier'
                          ' named Phillip, a gang of mice and the regents '
                          'who preside over three Realms: Land of Snowflakes,'
                          ' Land of Flowers, and Land of Sweets. Clara and'
                          ' Phillip must brave the ominous Fourth Realm, home '
                          'to the tyrant Mother Ginger, to retrieve Clara\'s '
                          'key and hopefully return harmony to the unstable'
                          ' world.',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SimilarMovies(
            images: similarMoviesList(),
            title: 'Similar Movies',
            imageHeight: 170.0,
            imageWidth: 200.0,
          ),

        ],
      ),
    );
  }

//  widgets

//  --------- top curved image --------------

  Container curvedImage() {
    return Container(
      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      child: Hero(
        tag: 'movie_url',
        child: ClipShadowPath(
          clipper: CircularClipper(),
          shadow: Shadow(blurRadius: 20.0),
          child: Image(
            height: 300.0,
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/nutcracker.jpg'),
          ),
        ),
      ),
    );
  }

//  ---------- Action Bar -----------------
  Container actionBar() {
    return Container(
      color: Colors.white12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(15),
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
            iconSize: 30.0,
            color: Colors.black,
            tooltip: 'Back',
          ),
          Image(
            image: AssetImage('assets/images/netflix_logo.png'),
            height: 50.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          IconButton(
            padding: EdgeInsets.all(15),
            onPressed: () => print('Add To Favorites'),
            icon: Icon(Icons.favorite_border),
            color: Colors.black,
            tooltip: 'Add To Favorites',
          ),
        ],
      ),
    );
  }
//--------- Play Pause Button
  Positioned playPauseAnchorButton(){
    return Positioned.fill(
        bottom: 20.0,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: RawMaterialButton(
            onPressed: () => displaySnackBar('Play Video'),
            padding: EdgeInsets.all(10.0),
            elevation: 12.0,
            shape: CircleBorder(),
            fillColor: Colors.white,
            child: Icon(Icons.play_arrow,
              size: 40.0,
              color: Colors.red,
            ),
          ),
        )
    );
  }
//  --------- Add To list widget----------
  Positioned addToMyListWidget(){
    return  Positioned(
      bottom: 0.0,
      left: 20.0,
      child: IconButton(
        onPressed: () => print('add'),
        icon: Icon(Icons.add),
        iconSize: 30.0,
        color: Colors.black,
      ),
    );
  }
//  share widget
  Positioned shareWidget(){
    return Positioned(
      bottom: 0.0,
      right: 20.0,
      child: IconButton(
        onPressed: () => print('Share'),
        icon: Icon(Icons.share),
        iconSize: 23.0,
        color: Colors.black,
      ),
    );
  }

//  Ratting bar
  Row rattingBar() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Icon(
          Icons.star,
          color: Colors.black,
        ),
      ],
    );
  }
//  Similar Movies

  List<String> similarMoviesList(){
    List<String> images = List();

    images.add('assets/images/nutcracker_0.jpg');
    images.add('assets/images/nutcracker_1.jpg');
    images.add('assets/images/nutcracker_0.jpg');
    images.add('assets/images/nutcracker_1.jpg');
    images.add('assets/images/nutcracker_0.jpg');
    images.add('assets/images/nutcracker_1.jpg');
    images.add('assets/images/nutcracker_0.jpg');

    return images;
  }

//   -------- Display Snackbar ----------

  SnackBar displaySnackBar(String message){
      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: "UNDO",
          onPressed: () {

          },
        ),
      );
  }
}
