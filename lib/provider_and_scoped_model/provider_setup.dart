import 'package:flutter/cupertino.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/user.dart';
import 'package:flutter_app/provider_and_scoped_model/core/services/api.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/provider_and_scoped_model/core/services/authentications_service.dart';
import 'package:provider/single_child_widget.dart';

/*
From Provider v4.0.0

The SingleChildCloneableWidget interface is removed, and replaced by a SingleChildWidget interface and two implementations:

SingleChildStatelessWidget
SingleChildStatefulWidget

MultiProvider will accept a SingleChildWidget instead of SingleChildCloneableWidget.
  */


  List<SingleChildWidget> providers = [
    ...independentServices,
    ...dependentServices,
    ...uiConsumableProviders,
  ];

  List<SingleChildWidget> independentServices = [
    Provider.value(value: Api())
  ];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    update : (context, api, authentication) =>  AuthenticationService(api: api)
  )
];


List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<User>(
    create: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
  )

];

