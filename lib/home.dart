import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/bloc_main.dart';
import 'package:flutter_app/bloc_counter_example/counter.dart';
import 'package:flutter_app/build_a_custom_widget.dart';
import 'package:flutter_app/buttons.dart';
import 'package:flutter_app/isolate.dart';
import 'package:flutter_app/netflix/screens/home_screen.dart';
import 'package:flutter_app/netflix/screens/movie_details_screen.dart';
import 'package:flutter_app/provider/common/text_styles.dart';
import 'package:flutter_app/provider/common/theme.dart';
import 'package:flutter_app/provider_and_scoped_model/provider_main.dart';
import 'package:flutter_app/row_and_column.dart';
import 'package:flutter_app/run_on_ui_thread_in_flutter.dart';
import 'package:flutter_app/stack_and_positioned.dart';
import 'package:flutter_app/start_activity_for_result_in_flutter.dart';
import 'package:flutter_app/state_handle_by_parent_widget.dart';
import 'package:flutter_app/stateful_widget.dart';
import 'package:flutter_app/text_input.dart';
import 'package:flutter_app/text_widget.dart';
import 'package:flutter_app/widget_manages_own_state.dart';

import 'a_mix_match_approach.dart';
import 'add_remove_component.dart';
import 'animate_a_widget.dart';
import 'handle_incoming_intent.dart';
import 'interactivity.dart';
import 'layout_in_flutter_exercise_one.dart';
import 'layout_in_flutter_exercise_two.dart';
import 'navigation_and_routing/animate_a_widget_accross_screen.dart';
import 'navigation_and_routing/navigate_wi_named_routes.dart';
import 'navigation_and_routing/pass_argument_to_named_route.dart';
import 'navigation_and_routing/return_data_like_activity_result.dart';
import 'navigation_and_routing/send_data_to_new_screen.dart';
import 'provider/provider_example.dart';
import 'provider/screens/my_login.dart';
import 'sqlite/sqlite_example.dart';
import 'state_management/state_managemet_ephemeral_(local_or_ui_state)_state.dart';

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
  '17.1 Widget manages own state',
  '17.2 Widget state handling with Parent widget',
  '17.3 A mix-and-match approach',
  '18.1 Navigation & Routing (Animate a widget across screens)',
//  '18.2 Navigate with named routes',
  '18.3 Named Route with Arguments',
  '18.4 Pass arguments to a named route',
  '18.5 Return Data like onActivityResult()',
  '18.6 Send Data To New Screen',
  '19.1 State Management : Ephemeral (Local or Ui State) State',
  'Provider Example',
  'SQlite Example',
  'Provider Architecture (Provider & Scoped Model)',
  'Bloc pattern',
  'Bloc : Flutter Counter Example',
  'Netflix Demo'
];

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home Page",
      theme: appTheme,
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
          "Home Page",
          style: headerStyle,
        ),
      ),
      body: myListItems(context),
    );
  }


  ListView myListItems(BuildContext context){
//    items.reversed;
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
        return Card(
          elevation: 2.0,
          child:  ListTile(
            title: Text(/*'${index + 1} ' +*/ items[index]),
//          subtitle: Text("Sub Title"),
//            leading: Icon(Icons.thumb_up),
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
      case 16: {
        c = ManageWidgetOwnState(index);
      }break;
      case 17: {
        c = ParentWidget(index);
      }break;
      case 18: {
        c = ParentWidgetMixMatchApproach(index);
      }break;
      case 19: {
        c = AnimateWidgetMainScreen(index);
      }break;
      case 20: {
        c = NamedRoutes(index);
      }break;
      case 21: {
        c = PassArguments();
      }break;
      case 22: {
        c = ReturnDataHomeScreen();
      }break;
      case 23: {
        c = SendDataToNewScreen();
      }break;
      case 24: {
        c = EphemeralStateHomePage();
      }break;
      case 25: {
        c = ProviderExample();
      }break;
      case 26: {
        c = SQLiteExample();
      }break;
      case 27: {
        c = ProviderArchitecture();
      }break;
      case 28: {
        c = BlocPattern();
      }break;
      case 29: {
        c = BlocCounterExample();
      }break;
      case 30: {
        c = NetflixDashboard();
      }break;
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => c));
  }



}
