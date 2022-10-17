class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "130f2192544a6e6ed687a261d736f929";

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

       static  String MovieDetailPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static  String MovieRecommendationsPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
}
