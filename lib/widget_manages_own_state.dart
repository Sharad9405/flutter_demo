// TapboxA manages its own state.
import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}


//------------------------- ManageWidgetOwnState ----------------------------------

class ManageWidgetOwnState extends StatelessWidget {
  ManageWidgetOwnState(int index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State management with Widget itself',
      home: Scaffold(
        appBar: AppBar(
          title: Text('State management with Widget itself'),
        ),
        body: Center(
          child: TapboxA(),
        ),
      ),
    );
  }
}