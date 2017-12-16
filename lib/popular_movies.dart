import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'api_client.dart';

import 'model.dart';

class PopularMoviesWidget extends StatefulWidget {
  final APIClient apiClient;
  final MovieCallback onMovieTap;

  PopularMoviesWidget({@required this.apiClient, @required this.onMovieTap});

  @override
  _PopularMoviesWidgetState createState() => new _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  Future<List<Movie>> movies;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Popular"),
      ),
      body: new FutureBuilder(
          future: movies,
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
                    itemBuilder: (context, i) => new _MovieListTile(
                          movie: movies[i],
                          onTap: () => widget.onMovieTap(movies[i]),
                        ),
                  );
                }
            }
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    movies = widget.apiClient.getPopularMovies();
  }
}

class _MovieListTile extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  _MovieListTile({@required this.movie, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(movie.title),
      subtitle: new Text(
        movie.overview,
        maxLines: 2,
      ),
      leading: new Image.network(movie.imageUri),
      isThreeLine: true,
      onTap: onTap,
    );
  }
}
