import 'package:flutter/material.dart';
import 'package:flutter_app/provider_and_scoped_model/core/base/base_widget.dart';
import 'package:flutter_app/provider_and_scoped_model/core/constant/app_constant.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/login/login_header.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/login/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

//    var mLoginViewModel = Provider.of<LoginViewModel>(context);

/*

      return Provider<LoginViewModel>(
        create: (_) => LoginViewModel(),
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: Text(
              'Loign View',
            ),
          ),
        ),
      );

*/

/*
    return MultiProvider(
      providers: providers,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Text(
              'Login View'
          ),
        ),
      ),
    );

 */
/*
    return ChangeNotifierProvider<LoginViewModel>.value
      (value: LoginViewModel(
        // Inject authentication service setup in the provider_setup
        authenticationService: Provider.of(context)
        ),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: Center(child: Text('Login View')
            )
        ),
      ),
    );
    */

/*
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: LoginViewModel(authenticationService: Provider.of(context)),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              LoginHeader(controller: _controller),
              model.busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )

                  : Center(
                      child: FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                              var loginSuccess = await model.login(_controller.text);
                              if(loginSuccess){
                                print('login sucess');
                                var logger = Logger ();
                                logger.d('Login Success');

                                Navigator.pushNamed(context, RoutePaths.Home);
                              }
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );

    */
    return BaseWidget<LoginViewModel>(
      mViewModel: LoginViewModel(authenticationService: Provider.of(context)),
      child: LoginHeader(controller: _controller),
      builder: (context, mViewModel, child) => Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            LoginHeader(controller: _controller),
          child,
            mViewModel.isLoading ? Center(
              child: CircularProgressIndicator(),) : Center(
              child: FlatButton(
                color: Colors.white,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  var loginSuccess = await mViewModel.login(_controller.text);
                  if(loginSuccess){
                    print('login sucess');
                    var logger = Logger ();
                    logger.d('Login Success');
                    Navigator.pushNamed(context, RoutePaths.Home);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
