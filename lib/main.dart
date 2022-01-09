import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF00061a),
        shadowColor: const Color(0xFF001456),
        splashColor: const Color(0xFF4169e8),
      ),

      home: const HomeScreen(),
    );
  }
}







// darkTheme: ThemeData(
// primarySwatch: Colors.deepOrange,
// scaffoldBackgroundColor: HexColor('333739'),
// appBarTheme: AppBarTheme(
// titleSpacing: 20.0,
// backwardsCompatibility: false,
// systemOverlayStyle: SystemUiOverlayStyle(
// statusBarColor: HexColor('333739'),
// statusBarIconBrightness: Brightness.light,
// ),
// backgroundColor: HexColor('333739'),
// elevation: 0.0,
// titleTextStyle: TextStyle(
// color: Colors.white,
// fontSize: 20.0,
// fontWeight: FontWeight.bold,
// ),
// iconTheme: IconThemeData(
// color: Colors.white,
// ),
// ),
// floatingActionButtonTheme: FloatingActionButtonThemeData(
// backgroundColor: Colors.deepOrange,
// ),
// bottomNavigationBarTheme: BottomNavigationBarThemeData(
// type: BottomNavigationBarType.fixed,
// selectedItemColor: Colors.deepOrange,
// unselectedItemColor: Colors.grey,
// elevation: 20.0,
// backgroundColor: HexColor('333739'),
// ),
// textTheme: TextTheme(
// bodyText1: TextStyle(
// fontSize: 18.0,
// fontWeight: FontWeight.w600,
// color: Colors.white,
// ),
// ),
// ),