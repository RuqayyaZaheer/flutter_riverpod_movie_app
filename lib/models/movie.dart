import 'package:get_it/get_it.dart';
import 'package:movie_riverpod/models/app_config.dart';

class Movie {
  final String? name,
      language,
      description,
      posterPath,
      backdropPath,
      releaseDate;

  final bool? isAdult;
  final num? rating;

  Movie({
    this.name,
    this.language,
    this.description,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.isAdult,
    this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic>? _json) {
    return Movie(
      name: _json!["title"],
      language: _json["original_language"],
      isAdult: _json["adult"],
      description: _json["overview"],
      posterPath: _json["poster_path"],
      backdropPath: _json["backdrop_path"],
      rating: _json["vote_average"],
      releaseDate: _json["release_date"],
    );
  }

  String posterURL() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.BASE_IMAGE_API_URL}${this.posterPath}';
  }
}
