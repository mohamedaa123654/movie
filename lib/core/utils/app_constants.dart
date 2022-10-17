import 'package:flutter/material.dart';

class AppConstants {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => '$baseImageUrl$path';
  // static const w = MediaQueryData.size.width;
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double w;
  static late double tw;
  static late double h;
  static double? defaultSize;
  static Orientation? orientation;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    orientation = _mediaQueryData.orientation;
    w = orientation == Orientation.portrait
        ? _mediaQueryData.size.width
        : _mediaQueryData.size.height;
    h = orientation != Orientation.portrait
        ? _mediaQueryData.size.width
        : _mediaQueryData.size.height;
    tw = _mediaQueryData.size.width;
  }
}
