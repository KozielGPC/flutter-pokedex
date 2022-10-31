import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app_colors.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme =
        GoogleFonts.pressStart2pTextTheme(Theme.of(context).textTheme);

    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleTextStyle: textTheme.headline6),
          textTheme: textTheme,
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: AppColors.softGrey,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48),
                  borderSide: BorderSide.none))),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        // '/wild_search':(context) => const WildSearchScreen(),
        // '/details':(context) => const DetailsScreen(),
      },
    );
  }
}