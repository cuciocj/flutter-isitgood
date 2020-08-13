import 'package:flutter/material.dart';
import 'package:flutter_isitgood/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Is It Good App',
      initialRoute: Routes.searchRoute,
      routes: Routes.getRoutes(context),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.comingSoonTextTheme(
            Theme.of(context).textTheme,
          )),
    );
  }
}
