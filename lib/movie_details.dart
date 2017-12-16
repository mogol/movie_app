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
      body: new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new Container(
              height: 200.0,
              child: new Center(
                child: new Image.network(movie.backdropUri),
              ),
            ),
            new Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: new Text(
                movie.title,
                maxLines: 1,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Text(
              movie.overview,
            ),
            new Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: new Row(
                children: [
                  new Text('Release date: '),
                  new Text(movie.releaseDate,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: new Row(
                children: [
                  new Text(
                      'Rating: ${movie.voteAverage} from ${movie.voteCount}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
