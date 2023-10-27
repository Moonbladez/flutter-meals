import 'package:flutter/material.dart';
import 'package:flutter_meals_app/categories/categories_screen.dart';

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
        useMaterial3: true,
      ),
      home: const CategoriesScreen(),
    );
  }
}
