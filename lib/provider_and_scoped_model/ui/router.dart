import 'package:flutter/material.dart';
import 'package:flutter_app/provider_and_scoped_model/core/constant/app_constant.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/post.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/comment/comment_view.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/login/login_view.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/posts/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.Post:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => CommentView(post: post));
      default :
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}'
              ),
            ),
          )
        );
    }
  }
}