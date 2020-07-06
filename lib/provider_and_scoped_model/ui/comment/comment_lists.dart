import 'package:flutter/material.dart';
import 'package:flutter_app/provider_and_scoped_model/core/base/base_widget.dart';
import 'package:flutter_app/provider_and_scoped_model/core/constant/app_constant.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/user.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/posts/PostListItem.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/posts/post_view_model.dart';
import 'package:provider/provider.dart';

class CommentList extends StatelessWidget {

  CommentList({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsViewModel>(
      mViewModel: PostsViewModel(api: Provider.of(context)),
      onViewModelReady: (mViewModel) => mViewModel.getPosts(Provider.of<User>(context).id),

      builder: (context, mViewModel, child) => mViewModel.isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
            itemCount: mViewModel.posts.length,
            itemBuilder: (context, index) => PostListItem(
              post: mViewModel.posts[index],
              onTap: (){
//                  Navigator.pushNamed(context, RoutePaths.Post,arguments: mViewModel.posts[index]);
              },
            ),
      )
    );
  }
}
