import 'package:flutter/material.dart';
import 'package:flutter_app/provider_and_scoped_model/core/base/base_model.dart';
import 'package:flutter_app/provider_and_scoped_model/core/services/authentications_service.dart';

class LoginViewModel extends BaseViewModel{

  AuthenticationService _authenticationService;


  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService  = authenticationService;

  Future<bool> login(String userIdText) async{
    setLoading(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setLoading(false);
    return success;
  }

}