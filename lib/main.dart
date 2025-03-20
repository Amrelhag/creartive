import 'package:creartive/ui/Home/screen/WelcomeScreen.dart';
import 'package:creartive/ui/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SplashScreen.routeName:(_)=>SplashScreen(),
        WelcomeScreen.routeName:(_)=>WelcomeScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
