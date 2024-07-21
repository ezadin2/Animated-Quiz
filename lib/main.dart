import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/start_quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light, // Specify brightness here
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontSize: 22,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: foregroundColor,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.black, fontFamily: 'Raleway'), // Updated property
          bodyLarge: TextStyle(color: Colors.black, fontFamily: 'Raleway'), // Updated property
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark, // Specify brightness here
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontSize: 22,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: foregroundColor,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontFamily: 'Raleway'), // Updated property
          bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Raleway'), // Updated property
        ),
        scaffoldBackgroundColor: backgroundColor,
      ),
      themeMode: ThemeMode.system,
      home: StartQuizScreen(),
    );
  }
}
