import 'package:movie_riverpod/models/search_categoty.dart';

import 'movie.dart';

class MainPageData {
  final List<Movie>? movies;
  final int? page;
  final String? searchCategoty;
  final String? searchText;

  MainPageData({this.movies, this.page, this.searchCategoty, this.searchText});

  MainPageData.inital()
      : movies = [],
        page = 1,
        searchCategoty = SearchCategory.populer,
        searchText = '';

  MainPageData copyWith(
      List<Movie> movies, int page, String categoty, String textSearch) {
    return MainPageData(
        movies: movies ?? this.movies,
        page: page ?? this.page,
        searchCategoty: searchCategoty ?? this.searchCategoty,
        searchText: searchText ?? this.searchText);
  }
}
