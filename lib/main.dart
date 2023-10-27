import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/dummy_data.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

final kThemeData = ColorScheme.fromSeed(seedColor: Colors.deepOrange);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
        colorScheme: kThemeData,
        appBarTheme: AppBarTheme(
          backgroundColor: kThemeData.primary,
          foregroundColor: kThemeData.onPrimary,
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: const MealsScreen(
        title: 'test',
        meal: dummyMeals,
      ),
    );
  }
}
