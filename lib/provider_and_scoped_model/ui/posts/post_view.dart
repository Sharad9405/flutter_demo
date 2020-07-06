import 'package:flutter/material.dart';
import 'package:flutter_app/provider/common/text_styles.dart';
import 'package:flutter_app/provider_and_scoped_model/core/constant/ui_helper.dart';
import 'package:flutter_app/provider_and_scoped_model/core/models/user.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/posts/posts.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/shared/app_colors.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome ${Provider.of<User>(context).name}',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Here are all your posts', style: subHeaderStyle),
          ),
          UIHelper.verticalSpaceSmall,
          Expanded(
              child: PostsList()
          ),
        ],
      ),
    );
  }
}
