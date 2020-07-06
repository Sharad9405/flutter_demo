import 'dart:async';

import 'package:flutter_app/provider_and_scoped_model/core/models/user.dart';
import 'package:flutter_app/provider_and_scoped_model/core/services/api.dart';

class AuthenticationService{
  final Api _api;

  AuthenticationService({Api api}) : _api = api;


  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> login (int userId)  async {
    var fetchUser = await _api.getUserProfile(userId);
    var hasUSer = fetchUser != null;
    if(hasUSer){
      _userController.add(fetchUser);
    }
    return hasUSer;
  }

}