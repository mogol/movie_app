import 'package:flutter/services.dart';

import 'dart:async';

import 'model.dart';

import 'dart:convert';

class APIClient {
  final _baseUrl = 'https://api.themoviedb.org';
  final _apiKey = '5e5477c0bf90cf41342d54f8ac24a961';

  final _httpClient = createHttpClient();

  Future<List<Movie>> getPopularMovies() async {
    final response =
        await _httpClient.get("$_baseUrl/3/movie/popular?api_key=$_apiKey");
    final Map data = JSON.decode(response.body);
    final List<Map> moviesData = data['results'];
    final movies = moviesData.map(
      (map) => new Movie(
            title: map['title'],
            overview: map['overview'],
            imageUri: 'https://image.tmdb.org/t/p/w500${map['poster_path']}',
          ),
    );
    return movies.toList(growable: false);
  }
}
