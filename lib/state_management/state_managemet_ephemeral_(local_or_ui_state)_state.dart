import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';

class EphemeralStateHomePage extends StatefulWidget {
  @override
  _EphemeralStateHomePageState createState() => _EphemeralStateHomePageState();
}

class _EphemeralStateHomePageState extends State<EphemeralStateHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ephemeral Or Local/Ui State',
      theme: ThemeData(
          primarySwatch: Colors.cyan
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ephemeral Or Local/Ui State',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: BottomNavigationBar(
          currentIndex: _index,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
          onTap: (newState) {
            setState(() {
              _index = newState;
            });
          },
        ),
      ),
    );
  }
}
