import 'package:flutter/cupertino.dart';
import 'package:flutter_isitgood/screens/search.dart';
import 'package:flutter_isitgood/screens/search_results.dart';

class Routes {
  static final String searchRoute = '/';
  static final String searchResultRoute = '/results';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return <String, WidgetBuilder>{
      searchRoute: (_) => Search(),
      searchResultRoute: (_) => SearchResults(),
    };
  }
}
