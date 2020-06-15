import 'package:flutter/material.dart';
import 'package:flutter_app/build_a_custom_widget.dart';
import 'package:flutter_app/buttons.dart';
import 'package:flutter_app/isolate.dart';
import 'package:flutter_app/row_and_column.dart';
import 'package:flutter_app/run_on_ui_thread_in_flutter.dart';
import 'package:flutter_app/stack_and_positioned.dart';
import 'package:flutter_app/start_activity_for_result_in_flutter.dart';
import 'package:flutter_app/stateful_widget.dart';
import 'package:flutter_app/text_input.dart';
import 'package:flutter_app/text_widget.dart';

import 'add_remove_component.dart';
import 'adding_interactivity.dart';
import 'animate_a_widget.dart';
import 'handle_incoming_intent.dart';
import 'layout_in_flutter_exercise_one.dart';
import 'layout_in_flutter_exercise_two.dart';

void main() => runApp(MyHome());

List<String> items = [
  '1.  Text Widget',
  '2.  Buttons Widget',
  '3.  Row And Column Widget',
  '4.  Stack, Container And Positioned Widget',
  '5.  Stateful Widget',
  '6.  Add-Remove Component From Layout',
  '7.  Animate A Widget',
  '8.  Build custom widgets',
  '9.  Handle Incoming Intent Data',
  '10. startActivityForResult() equivalent in Flutter',
  '11. equivalent of runOnUiThread() in Flutter using Future, Async, await',
  '12. Isolate example',
  '13. show validation errors',
  '14. Layout in Flutter : Exercise 1',
  '15. Layout Totorial',
  '16. Adding Interactivity',
];

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home Page",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyList(
      ),
    );
  }
}


class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page"
        ),
      ),
      body: myListItems(context),
    );
  }


  ListView myListItems(BuildContext context){
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
        return Card(
          elevation: 2.0,
          child:  ListTile(
            title: Text(/*'${index + 1} ' +*/ items[index]),
//          subtitle: Text("Sub Title"),
            leading: Icon(Icons.thumb_up),
//          trailing: Icon(Icons.arrow_forward),
//          onTap: (){
//            Navigator.push(context,
//            MaterialPageRoute(builder: (context) => IconBtn(index)));
//          },
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              splashColor: Colors.red,
              onPressed: (){
                navigate(context,index);
              },
            ),
          ),
        );
      },
    );
  }

  void navigate(BuildContext context, int index){
    var c ;
    switch(index){
      case 0: {
//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => TextWidget(index)));
        c = TextWidget(index);
      }break;
      case 1: {
//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => IconBtn(index)));
        c = IconBtn(index);
      }break;
      case 2: {
//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => RowAndColumn(index)));
        c = RowAndColumn(index);
      }break;
      case 3: {
//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => StackAndPositionedWidget(index)));
        c = StackAndPositionedWidget(index);
      }break;
      case 4: {
//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => StateFulWid(index)));
        c = StateFulWid(index);
      }break;
      case 5: {
//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => AddRemoveApp(index)));
        c = AddRemoveApp(index);
      }break;
      case 6: {
//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => FadeAppTest(index)));
        c = FadeAppTest(index);
      }break;
      case 7: {
//        Navigator.push(context,
//            MaterialPageRoute(builder: (context) => CustomButton(index)));
        c = CustomButton(index);
      }break;
      case 8: {
        c = HandleIncomingIntentData(index);
      }break;
      case 9: {
        c = StartActivityForResult(index);
      }break;
      case 10: {
        c = FutureAsyncAwaitUse(index);
      }break;
      case 11: {
        c = IsolateApp(index);
      }break;
      case 12: {
        c = TxtInput(index);
      }break;
      case 13: {
        c = LayoutInFlutterExerciseOne(index);
      }break;
      case 14: {
        c = LayoutInFlutterExerciseTwo(index);
      }break;
      case 15: {
        c = AddingInteractivity(index);
      }break;
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => c));
  }



}
