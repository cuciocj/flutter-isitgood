import 'package:flutter/material.dart';
import 'package:flutter_isitgood/model/movie.dart';
import 'package:flutter_isitgood/model/movie_list.dart';
import 'package:flutter_isitgood/services/tmdb_api.dart';
import 'package:flutter_isitgood/widgets/search_results/blurred_backdrop.dart';
import 'package:google_fonts/google_fonts.dart';

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

  // TODO: refactor
  Widget _buildSearchResultTile(BuildContext context, Movie movie) {
    double listItemTileHeight = MediaQuery.of(context).size.width * 0.5;
    
    movie.backdropPath == null ?
      print('backdrop is null') :
      print(movie.backdropPath);

    return Container(
      height: listItemTileHeight,
      child: Stack(
        children: <Widget>[
          BlurredBackdrop(movie.backdropPath),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 30, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    // TODO: avoid hardcoded string
                    image: movie.posterPath == null ? 
                      AssetImage('assets/images/poster_placeholder.png') :
                      NetworkImage('http://image.tmdb.org/t/p/w780${movie.posterPath}'),
                  ),
                ),
                Container(
                  width: 250.0,
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Text(
                            movie.name,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.black
                                  )
                                ]
                              )
                            ),
                          ),
                        ),
                      ),
                      Flexible( 
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          // color: Colors.purple[200],
                          child: Text(
                            movie.overview,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.black
                                  )
                                ]
                              )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchResultList(BuildContext context, List<Movie> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => 
        _buildSearchResultTile(context, list[index])
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieList>(
      future: movieList,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return _buildSearchResultList(context, snapshot.data.list);
        } else if(snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(
  //     children: <Widget>[
  //       _buildSearchResultTile(context),
  //     ]
  //   );
  // }
}