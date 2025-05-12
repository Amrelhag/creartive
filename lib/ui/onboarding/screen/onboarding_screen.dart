import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/onBoardingModel.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
import 'package:creartive/ui/onboarding/widget/onBoardingWidget.dart';
import 'package:creartive/ui/welcom/screen/WeclomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName='onBoarding';
   OnboardingScreen({super.key,});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
   int activeIndex=0;

   PageController controller=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged: (index){
                      activeIndex=index;
                      setState(() {

                      });
                    },
                    itemCount: OnBoardingModel.onBoardingList.length,
                    itemBuilder: (context,index){
                      OnBoardingModel onboarding=OnBoardingModel.onBoardingList[index];
                      return OnBoardingWidget(onBoardingModel: onboarding,);
                    },
                  ),
                ),


                Row (mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed:(){
                      controller.previousPage(duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      if(activeIndex< OnBoardingModel.onBoardingList.length) {
                        activeIndex--;
                      }
                      setState(() {

                      });
                    }, child:Visibility(visible: activeIndex!=0,
                      child: Text("Back",style: TextStyle(
                          color: ColorManager.primary,
                        //  fontFamily: "janna",
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      ),),
                    )),
                    AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: OnBoardingModel.onBoardingList.length,
                      effect:  ExpandingDotsEffect (
                          activeDotColor: ColorManager.primary
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: ColorManager.primary
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(onPressed:(){

                          if(activeIndex==OnBoardingModel.onBoardingList.length-1){
                            Navigator.pushReplacementNamed(context,
                              FirebaseAuth.instance.currentUser==null
                                  ?WelcomeScreen.routeName
                                  :HomeScreen.routeName ,);
                            return;
                          }

                          controller.nextPage(duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                          if(activeIndex< OnBoardingModel.onBoardingList.length) {
                            activeIndex++;
                          }
                          setState(() {

                          });
                        }, child:Text(activeIndex==OnBoardingModel.onBoardingList.length-1
                            ?"Finish"
                            :"Next",style: TextStyle(

                            color: ColorManager.secondary,
                           // fontFamily: "janna",
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),)),
                      ),
                    )
                  ],
                ),
                Gap(16),
              ],
            ),
          ) ),

    );
  }
}
