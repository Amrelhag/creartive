import 'dart:async';

import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName="splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),
            (){
      Navigator.pushReplacementNamed(context,HomeScreen.routeName);
    }

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorManager.secondary ,
      body: Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.primary
                  ),
                  child: Lottie.asset("assets/images/splashanimation.json")),
            ),
            Text("Welcome to our Community!",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: ColorManager.primary
            ),)
          ],
        ),
      ),
    );
  }
}
