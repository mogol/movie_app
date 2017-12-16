import 'package:meta/meta.dart';

class Movie {
  Movie({
    @required this.title,
    @required this.overview,
    @required this.imageUri,
  });

  final String title;
  final String overview;
  final String imageUri;
}

typedef void MovieCallback(Movie movie);
