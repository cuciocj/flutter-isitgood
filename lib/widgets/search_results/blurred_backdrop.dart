import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBackdrop extends StatelessWidget {
  final String imagePath;

  BlurredBackdrop(this.imagePath);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.width * 0.5;
    
    return Container(
      // height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: this.imagePath == null ?
            // TODO: avoid hardcoded string
            AssetImage('assets/images/backdrop_placeholder.png') :
            NetworkImage('http://image.tmdb.org/t/p/w780/${this.imagePath}'),
          fit: BoxFit.cover
        ),
      ),
      child: ClipRect(
        child:  BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple[900].withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}