import 'package:flutter/material.dart';
import 'package:flutter_app/provider/common/theme.dart';
import 'package:flutter_app/provider_and_scoped_model/core/constant/app_constant.dart';
import 'package:flutter_app/provider_and_scoped_model/provider_setup.dart';
import 'package:flutter_app/provider_and_scoped_model/ui/router.dart';
import 'package:provider/provider.dart';

class ProviderArchitecture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
      title: 'Provider & Scoped Model',
      theme: appTheme,
      initialRoute: RoutePaths.Login,
      onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
