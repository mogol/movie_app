import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Center(
        child: new PopularMoviesWidget(),
      ),
    );
  }
}

class PopularMoviesWidget extends StatelessWidget {
  final _apiClient = new APIClient();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Popular"),
      ),
      body: new FutureBuilder(
          future: _apiClient.getPopularMovies(),
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new Center(child: new Text('Awaiting result...'));
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else {
                  final movies = snapshot.data;
                  return new ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, i) {
                      final movie = movies[i];
                      return new ListTile(
                        title: new Text(movie.title),
                        subtitle: new Text(
                          movie.overview,
                          maxLines: 2,
                        ),
                        leading: new Image.network(movie.imageUri),
                        isThreeLine: true,
                        onTap: () =>
                            Navigator.of(context).push(_showDetails(movie)),
                      );
                    },
                  );
                }
            }
          }),
    );
  }

  Route _showDetails(Movie movie) => new MaterialPageRoute<Null>(
        builder: (BuildContext context) => new MovieDetails(movie: movie),
      );
}

class MovieDetails extends StatelessWidget {
  final Movie movie;

  MovieDetails({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(movie.title),
      ),
      body: new Center(
        child: new Text(movie.overview),
      ),
    );
  }
}

class Movie {
  Movie(
      {@required this.title, @required this.overview, @required this.imageUri});

  final String title;
  final String overview;
  final String imageUri;
}

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
