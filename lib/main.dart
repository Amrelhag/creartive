import 'package:creartive/firebase_options.dart';
import 'package:creartive/ui/events/screen/event_screen.dart';
import 'package:creartive/ui/login/screen/LoginScreen.dart';
import 'package:creartive/ui/onboarding/screen/onboarding_screen.dart';
import 'package:creartive/ui/reset_password/screen/reset_password_screen.dart';
import 'package:creartive/ui/setting/screen/setting_screen.dart';
import 'package:creartive/ui/splash/screen/splash_screen.dart';
import 'package:creartive/ui/welcom/screen/WeclomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      routes: { HomeScreen.routeName:(_)=>HomeScreen(),
        SplashScreen.routeName:(_)=>SplashScreen(),
        WelcomeScreen.routeName:(_)=>WelcomeScreen(),
        ResetPasswordScreen.routeName:(_)=>ResetPasswordScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        SettingScreen.routeName:(_)=>SettingScreen(),
        EventScreen.routeName:(_)=>EventScreen(),
        OnboardingScreen.routeName:(_)=>OnboardingScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
