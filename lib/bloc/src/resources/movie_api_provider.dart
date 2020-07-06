import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/src/models/item_model.dart';
import 'package:http/http.dart';


class MovieApiProvider {
  Client client = Client();
  final _apiKey = '671ea541a469d6ebded23881e9323133';

  Future<ItemModel> fetchMoviesList() async {
    print('entered');
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());

    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }

}
