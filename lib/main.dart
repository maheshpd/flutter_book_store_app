import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_book_store_app/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.teal,
          selectedLabelStyle: TextStyle(fontSize: 12.0),
          showUnselectedLabels: false
        )
      ),
      home:  HomeScreen(),
    );
  }
}

