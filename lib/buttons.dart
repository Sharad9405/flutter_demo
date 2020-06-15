import 'package:flutter/material.dart';

//void main() => runApp(IconBtn());

// Flat button, Raised Button, Material Button, icon button

// Flat Button

class FlatBtn extends StatelessWidget {
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
            child: FlatButton(
//            color: Colors.black, // background color
//          splashColor: Colors.cyan, // hover color effect on click
              textColor: Colors.red,
//            padding: EdgeInsets.all(10.0),
              highlightColor: Colors.green,
              // highlight color
              onPressed: () {},
              // (){}- > this will do nothing,  null - > will hide the view
              child: Text( // text, icon, image
                "Flat Button",
                style: TextStyle(
                    fontSize: 30.0
                ),
              ),
            )
        ),
      ),
    );
  }
}


class RaisedBtn extends StatelessWidget {
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
            child: RaisedButton(
              onPressed: (){},
              textColor: Colors.black,
              color: Colors.white,
//              splashColor: Colors.cyan,
//              highlightColor: Colors.green,
            elevation: 10.0,
//              highlightElevation: 30.0,
              shape: Border.all(width: 2.0, color: Colors.black),
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Text(
                "Raised Button",
                style: TextStyle(
                  fontSize: 30.0
                ),
              ),
            )
        ),
      ),
    );
  }
}

class MaterialBtn extends StatelessWidget {
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
            child: MaterialButton(
              onPressed: (){},
              textColor: Colors.red[400],
              height: 40.0,
              minWidth: 200.0,
              splashColor: Colors.green,
              color: Colors.red[400],
              child: Text(
                "Material Button",
                style: TextStyle(
                    fontSize: 30.0,
                  color: Colors.white
                ),
              ),
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(25.0)
//              ),
//            shape: StadiumBorder(),
//              shape: OutlineInputBorder(),
              shape: Border.all(color: Colors.red[800], width: 5.0),  // border from
            )
        ),
      ),
    );
  }
}


class IconBtn extends StatelessWidget {
  final int index;
  IconBtn(this.index);

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
//            "Sample App",
            "$index"
          ),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
//            color: Colors.black, // background color
//          splashColor: Colors.cyan, // hover color effect on click
                  textColor: Colors.red,
//            padding: EdgeInsets.all(10.0),
                  highlightColor: Colors.green,
                  // highlight color
                  onPressed: () {},
                  // (){}- > this will do nothing,  null - > will hide the view
                  child: Text( // text, icon, image
                    "Flat Button",
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: (){},
                  textColor: Colors.black,
                  color: Colors.white,
//              splashColor: Colors.cyan,
//              highlightColor: Colors.green,
                  elevation: 10.0,
//              highlightElevation: 30.0,
                  shape: Border.all(width: 2.0, color: Colors.black),
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  child: Text(
                    "Raised Button",
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: (){},
                  textColor: Colors.red[400],
                  height: 40.0,
                  minWidth: 200.0,
                  splashColor: Colors.green,
                  color: Colors.red[400],
                  child: Text(
                    "Material Button",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white
                    ),
                  ),
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(25.0)
//              ),
//            shape: StadiumBorder(),
//              shape: OutlineInputBorder(),
                  shape: Border.all(color: Colors.red[800], width: 5.0),  // border from
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.add_a_photo,
                  ),
                  iconSize: 50.0,
                  splashColor: Colors.green,
                  tooltip: "Add A Photo",
                )
              ],
            )
        ),
      ),
    );
  }



}

