import 'package:flutter/material.dart';

//void main() => runApp(RowAndColumn());

class ColumnsOnly extends StatelessWidget {
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
          child:    Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "This is a text widget",
                style: TextStyle(
                    fontSize: 24.0
                ),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text(
                  "Raised Button 1",
                  style: TextStyle(
                      fontSize: 24.0
                  ),
                ),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text(
                  "Raised Button 2",
                  style: TextStyle(
                      fontSize: 24.0
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

class RowOnly extends StatelessWidget {
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
          child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){},
              child: Text(
                "Raised Button 1",
                style: TextStyle(
                  fontSize: 24.0
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){},
              child: Text(
                "Raised Button 2",
                style: TextStyle(
                    fontSize: 24.0
                ),
              ),
            )
          ],
        ),
        ),

      ),
    );
  }
}

class RowAndColumn extends StatelessWidget {

  final int index;
  RowAndColumn(this.index);

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
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child:  Text(
                  "This is a simple text",
                  style: TextStyle(
                      fontSize: 24.0,
                    color: Colors.blue,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){},
                      child: Text(
                        "Raised Button 1",
                        style: TextStyle(
                            fontSize: 24.0
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: (){},
                      child: Text(
                        "Raised Button 2",
                        style: TextStyle(
                            fontSize: 24.0
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: (){},
                child: Text(
                  "Like Us",
                  style: TextStyle(
                    fontSize: 24.0
                  ),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}