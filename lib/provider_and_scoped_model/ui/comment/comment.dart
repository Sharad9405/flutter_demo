import 'package:flutter/material.dart';
import 'package:flutter_app/provider_and_scoped_model/core/constant/ui_helper.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/comment_data.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/comment/comment_view_model.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/shared/app_colors.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final CommentData comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(comment.body),
        ],
      ),
    );
  }
}
