import 'package:e_commerce_route/pages/login_screen/login_view.dart';
import 'package:e_commerce_route/pages/register_screen/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RegisterScreen.routeName,
      routes: {
        RegisterScreen.routeName : (context)=>RegisterScreen(),
        LoginScreen.routeName : (context)=>LoginScreen()
      },
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent
        ),
        scaffoldBackgroundColor:Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0
        ),
        primaryColor: const Color(0xFF004182),
        textTheme: const TextTheme(
            labelLarge: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF004182)),
            labelMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF004182)),
            labelSmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Color(0xFF004182)),
            bodyMedium : TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF004182)
            )
        ),
      ),
    );
  }
}

