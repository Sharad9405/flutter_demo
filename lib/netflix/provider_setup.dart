


import 'package:flutter_app/provider_and_scoped_model/core/services/api.dart';
import 'package:provider/single_child_widget.dart';

//List<SingleChildWidget> providers = [
//  ...independentServices,
//  ...dependentServices,
//  ...uiConsumableProviders,
//];
//
//List<SingleChildWidget> independentServices = [
//  Provider.value(value: Api())
//];
//
//List<SingleChildWidget> dependentServices = [
//  ProxyProvider<Api, AuthenticationService>(
//      update : (context, api, authentication) =>  AuthenticationService(api: api)
//  )
//];
//
//
//List<SingleChildWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    create: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
//
//];