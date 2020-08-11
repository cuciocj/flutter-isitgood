import 'package:flutter/material.dart';
import 'package:flutter_isitgood/widgets/blurred_image.dart';

class SearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;

    return new Scaffold(
      appBar: AppBar(
        title: Text("Results for \"${args['query']}\""),
      ),
      body: SearchResultsList(),
    );
  }
}

class SearchResultsList extends StatefulWidget {
  const SearchResultsList({Key key}) : super(key: key);

  @override
  SearchResultsListState createState() => SearchResultsListState();
}

class SearchResultsListState extends State<SearchResultsList> {

  @override
  Widget build(BuildContext context) {
    return new Scrollbar(
      child: ListView(
        children: <Widget>[
          // TODO: make dynamic list
          BlurredImage(
            'http://image.tmdb.org/t/p/w780/qOQFBEbNqDu7tmfL9wKMc8ECW3L.jpg'
          ),
          BlurredImage(
            'http://image.tmdb.org/t/p/w780//rtYQCa2NzX8RspbOmwfAla6BemO.jpg'
          ),
          BlurredImage(
            'http://image.tmdb.org/t/p/w780/3yEHM2HT2vrUtO93YzTJNgEfiZG.jpg'
          ),
          BlurredImage(
            'http://image.tmdb.org/t/p/w780/s6k1teuMVH01038PhjpvgX4dmht.jpg'
          )
        ],
      ),
    );
  }

}