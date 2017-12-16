import 'package:flutter/material.dart';
import 'api_client.dart';
import 'movie_details.dart';
import 'popular_movies.dart';
import 'model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new _MoviesHome());
  }
}

class _MoviesHome extends StatelessWidget {
  final _apiClient = new APIClient();

  @override
  Widget build(BuildContext context) {
    return new PopularMoviesWidget(
      apiClient: _apiClient,
      onMovieTap: (Movie movie) {
        Navigator.of(context).push(_showDetails(movie));
      },
    );
  }

  Route _showDetails(Movie movie) => new MaterialPageRoute<Null>(
        builder: (BuildContext context) => new MovieDetails(movie: movie),
      );
}
