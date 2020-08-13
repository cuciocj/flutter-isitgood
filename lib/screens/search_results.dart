import 'package:flutter/material.dart';
import 'package:flutter_isitgood/model/movie.dart';
import 'package:flutter_isitgood/model/movie_list.dart';
import 'package:flutter_isitgood/services/tmdb_api.dart';
import 'package:flutter_isitgood/widgets/search_results/search_result_tile.dart';

class SearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;

    return new Scaffold(
      appBar: AppBar(
        title: Text("Results for \"${args['query']}\""),
      ),
      body: SearchResultsList(searchQuery: args['query']),
    );
  }
}

class SearchResultsList extends StatefulWidget {
  final String searchQuery;

  const SearchResultsList({Key key, this.searchQuery}) : super(key: key);

  @override
  SearchResultsListState createState() => SearchResultsListState();
}

class SearchResultsListState extends State<SearchResultsList> {
  Future<MovieList> movieList;

  @override
  void initState() {
    super.initState();
    movieList = APIProvider().findByTitle(widget.searchQuery);
  }

  Widget _buildSearchResultList(BuildContext context, List<Movie> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => 
        SearchResultTile(movie: list[index])
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieList>(
      future: movieList,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return _buildSearchResultList(context, snapshot.data.list);
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}