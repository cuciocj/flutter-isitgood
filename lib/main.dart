import 'package:flutter/material.dart';
import 'package:flutter_isitgood/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Is It Good App',
      initialRoute: '/',
      routes: Router.getRoutes(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.comingSoonTextTheme(
            Theme.of(context).textTheme,
          )),
    );
  }
}