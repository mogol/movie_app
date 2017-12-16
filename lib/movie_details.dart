import 'package:flutter/material.dart';

import 'model.dart';
import 'package:meta/meta.dart';

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