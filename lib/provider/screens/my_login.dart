import 'package:flutter/material.dart';
import 'package:flutter_app/provider/common/text_styles.dart';



class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 40.0,left: 50.0,right: 50.0,bottom: 40.0),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome",
//                style: Theme.of(context).textTheme.headline1,
                    style: headerStyle,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password'
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  RaisedButton(
                    color: Colors.yellow,
                    child: Text(
                      'ENTER',
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/catalog');
                    },
                  )
                ],
              ),
        ),
      ),


    );
  }
}
