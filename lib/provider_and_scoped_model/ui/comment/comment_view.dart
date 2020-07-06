import 'package:flutter/material.dart';
import 'package:flutter_app/provider/common/text_styles.dart';
import 'package:flutter_app/provider_and_scoped_model/core/base/base_widget.dart';
import 'package:flutter_app/provider_and_scoped_model/core/constant/ui_helper.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/post.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/user.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/comment/comment.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/comment/comment_lists.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/comment/comment_view_model.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/posts/posts.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/shared/app_colors.dart';
import 'package:provider/provider.dart';

class CommentView extends StatelessWidget {
  final Post post;
  CommentView({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium,
            Text(post.body),
            Comments(post.id),
            UIHelper.verticalSpaceMedium,
            Text('Comments', style:subHeaderStyle),

            UIHelper.verticalSpaceSmall,
            Expanded(
                child: CommentList()
            ),

          ],
        ),
      ),
    );
  }



 /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium,
            Text(post.body),
            Comments(post.id),
          ],
        ),
      ),
    );
  }
*/
/*

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommentViewModel>(
        onViewModelReady: (mViewModel) => mViewModel.fetchComments(post.id),
        mViewModel: CommentViewModel(api: Provider.of(context)),
        builder: (context, mViewModel, child) => mViewModel.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
              child:Scaffold(
                backgroundColor: backgroundColor,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UIHelper.verticalSpaceLarge,
                      Text(post.title, style: headerStyle),
                      Text(
                        'by ${Provider.of<User>(context).name}',
                        style: TextStyle(fontSize: 9.0),
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(post.body),
                      Comments(post.id),

                      ListView.builder(
                        itemCount: mViewModel.comments.length,
                        itemBuilder: (context, index) =>
                            CommentItem(mViewModel.comments[index]),
                      ),
//

                    ],
                  ),
                ),
              ),
        ));
  }
*/




}
