import 'dart:convert';

import 'package:flutter_app/provider_and_scoped_model/core/models/comment_data.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/post.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/user.dart';
import 'package:http/http.dart' as http;

class Api{
  static const endPoint = 'https://jsonplaceholder.typicode.com';

  var client = http.Client();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await client.get('$endPoint/users/$userId');

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async{
    var posts = List<Post>();

    //get user post for id
    var response = await client.get('$endPoint/posts?userId=$userId');
    //parse into list
    var parsed = json.decode(response.body) as List<dynamic>;
    // loop and convert each item   to Post
    for (var post in parsed){
      posts.add(Post.fromJson(post));
    }
    return posts;
  }


  Future<List<CommentData>> getCommentsForPost(int postId) async {
    var comments = List<CommentData>();

    // Get comments for post
    var response = await client.get('$endPoint/comments?postId=$postId');

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(CommentData.fromJson(comment));
    }
    return comments;
  }


}