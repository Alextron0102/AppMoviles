import 'dart:convert';
import 'dart:io';
import 'package:flutter_app_mymovie/models/movie.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlBase = 'api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlKey = 'api_key=3cae426b920b29ed2fb1c0749f258325';
  //api.themoviedb.org/3/movie/upcoming?api_key=3cae426b920b29ed2fb1c0749f258325

  Future<List> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey;
    print(upcoming);
    http.Response result = await http.get(upcoming);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];

      List movies = moviesMap.map((i) =>
          Movie.fromJson(i)).toList();
      return movies;
    } else {
      print(result.body);
      return null;
    }
  }
}