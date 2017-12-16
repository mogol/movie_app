import 'package:meta/meta.dart';

class Movie {
  Movie({
    @required this.title,
    @required this.overview,
    @required this.imageUri,
    @required this.backdropUri,
    @required this.voteCount,
    @required this.voteAverage,
    @required this.releaseDate,
  });

  final String title;
  final String overview;
  final String imageUri;
  final String backdropUri;
  final int voteCount;
  final double voteAverage;
  final String releaseDate;
}

typedef void MovieCallback(Movie movie);
