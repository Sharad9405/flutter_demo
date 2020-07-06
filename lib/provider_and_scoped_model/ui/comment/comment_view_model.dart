import 'package:flutter/cupertino.dart';
import 'package:flutter_app/provider_and_scoped_model/core/base/base_model.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/comment_data.dart';
import 'package:flutter_app/provider_and_scoped_model/core/services/api.dart';

class CommentViewModel extends BaseViewModel{
  Api _api;

  CommentViewModel({@required Api api}) : _api = api;

  List<CommentData> comments;

  Future fetchComments(int postId) async {
    setLoading(true);
    comments = await _api.getCommentsForPost(postId);
    setLoading(false);
  }

}