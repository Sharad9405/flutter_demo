
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/provider_and_scoped_model/core/base/base_model.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/post.dart';
import 'package:flutter_app/provider_and_scoped_model/core/services/api.dart';

class PostsViewModel extends BaseViewModel{

  Api _api;
  List<Post> posts;

  PostsViewModel({@required Api api, }) : _api = api;


  Future getPosts(int userId) async {
    setLoading(true);
    posts = await _api.getPostsForUser(userId);
    setLoading(false);
  }
}