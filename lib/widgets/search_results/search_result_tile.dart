import 'package:flutter/material.dart';
import 'package:flutter_isitgood/model/movie.dart';
import 'package:flutter_isitgood/widgets/search_results/blurred_backdrop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SearchResultTile extends StatefulWidget {
  final Movie movie;

  const SearchResultTile({Key key, this.movie}) : super(key: key);

  @override
  SearchResultTileState createState() => SearchResultTileState();
}

class SearchResultTileState extends State<SearchResultTile> {

  String transformStringDate(String strDate, 
    String inputFormat, 
    String outputFormat) {
      DateTime dt = DateFormat(inputFormat).parse(strDate);
      return DateFormat(outputFormat).format(dt);
  }

  @override
  Widget build(BuildContext context) {
    double listItemTileHeight = MediaQuery.of(context).size.width * 0.5;

    return Container(
      height: listItemTileHeight,
      child: Stack( // extract title and other details part from Stack
        children: <Widget>[
          BlurredBackdrop(widget.movie.backdropPath),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 30, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    // TODO: avoid hardcoded string
                    image: widget.movie.posterPath == null ? 
                      AssetImage('assets/images/poster_placeholder.png') :
                      NetworkImage(
                        'http://image.tmdb.org/t/p/w780${widget.movie.posterPath}'
                      ),
                  ),
                ),
                Expanded(
                  // width: double.infinity,
                  // color: Colors.yellow,
                  // padding: EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 0,
                        child: Container( // TODO: refactor movie title section
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            widget.movie.name,
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
                        // fit: FlexFit.tight,
                        child: Container( // TODO: refactor movie release date
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 15),
                          child: Text(widget.movie.releaseDate != '' ?
                            transformStringDate(
                              '${widget.movie.releaseDate}',
                              'yyyy-MM-dd',
                              'MMMM dd, yyyy'
                            ) : 'No release date',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white70,
                                shadows: [
                                  Shadow(
                                    color: Colors.black
                                  )
                                ]
                              )
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container( // TODO: refactor genre list
                          padding: EdgeInsets.only(left: 15),
                          width: double.infinity,
                          child: Text('Drama | Action | Comedy',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white70,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black87
                                    )
                                  ]
                                )
                              ),
                            ),
                        ),
                      ),
                      Flexible(
                        child: Container( // TODO: refactor rating
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          // transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                          child: LinearPercentIndicator(
                            padding: EdgeInsets.only(left: 5, right: 10),
                            width: MediaQuery.of(context).size.width / 5,
                            lineHeight: 10.0,
                            percent: widget.movie.voteAverage / 10,
                            // progressColor: Colors.lightGreen,
                            linearGradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(95,160,237, 1),
                                Color.fromRGBO(237,136,181, 1)
                              ]
                            ),
                            trailing: Text(
                              '${widget.movie.voteAverage.toStringAsFixed(1)}',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white70,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 2.0,
                                      color: Colors.black87
                                    )
                                  ]
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible( // TODO: refactor overview section; fill remaning height
                        flex: 4,
                        fit: FlexFit.tight,
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              widget.movie.overview,
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white70,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black87
                                    )
                                  ]
                                )
                              ),
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

}