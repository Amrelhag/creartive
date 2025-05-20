import 'dart:async';

import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
import 'package:creartive/ui/login/screen/LoginScreen.dart';
import 'package:creartive/ui/onboarding/screen/onboarding_screen.dart';
import 'package:creartive/ui/welcom/screen/WeclomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    Timer(Duration(seconds: 3),
            (){
              Navigator.pushReplacementNamed(context,
                FirebaseAuth.instance.currentUser==null
                    ?OnboardingScreen.routeName
                    :HomeScreen.routeName ,);
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
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logoc.png",height: 160,width: 160,),
                ],
              ),
            ),
            Text("CreArtive",style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w500,
                color: ColorManager.primary,
              fontFamily: "JacquesFrancois"
            ),),
            Gap(16),
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
