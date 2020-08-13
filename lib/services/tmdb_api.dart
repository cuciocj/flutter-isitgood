import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_isitgood/model/movie_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIProvider {

  final String baseURL = 'https://api.themoviedb.org/3/';
  final String apiKey = DotEnv().env['API_KEY'];

  Future<MovieList> findByTitle(String title) async {
    String urlRequest = baseURL + 'search/movie?api_key=$apiKey&query=$title';
    print('$urlRequest');
    http.Response response = await http.get(urlRequest);

    return MovieList(json.decode(response.body));
  }
}

