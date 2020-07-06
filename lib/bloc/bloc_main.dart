import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/src/ui/movie_list.dart';
import 'package:flutter_app/provider/common/text_styles.dart';

class BlocPattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Pattern',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
//        appBar: AppBar(
//          title: Text(
//            'Bloc Pattern',
//            style: headerStyle,
//          ),
//        ),
        body: MovieList(),
      ),
    );
  }
}
