import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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
  final List<Movie> movies = Movie.allMovies();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Popular"),
      ),
      body: new ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, i) {
          final movie = movies[i];
          return new ListTile(
            title: new Text(movie.title),
            subtitle: new Text(movie.description),
            onTap: () => Navigator.of(context).push(_showDetails(movie)),
          );
        },
      ),
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
        child: new Text(movie.description),
      ),
    );
  }
}

class Movie {
  Movie({@required this.title, @required this.description});

  final String title;
  final String description;

  static List<Movie> allMovies() {
    final list = new List<int>.generate(10, (i) => i + 1);
    return list
        .map((i) => new Movie(title: "Title $i", description: "Description $i"))
        .toList(growable: false);
  }
}
