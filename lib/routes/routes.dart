import 'package:flutter/cupertino.dart';
import 'package:flutter_isitgood/screens/search.dart';
import 'package:flutter_isitgood/screens/search_results.dart';

class Router {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return <String, WidgetBuilder>{
      '/': (_) => Search(),
      '/results': (_) => SearchResults(),
    };
  }
}
