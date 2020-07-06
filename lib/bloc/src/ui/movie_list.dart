import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/src/blocs/movies_bloc.dart';
import 'package:flutter_app/bloc/src/models/item_model.dart';
import 'package:flutter_app/provider/common/text_styles.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bloc Pattern',
          style: headerStyle,
        ),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Image.network('https://image.tmdb.org/t/p/w185${snapshot.data
            .results[index].poster_path}',
        fit: BoxFit.cover,
        );
      },
    );
  }
}
