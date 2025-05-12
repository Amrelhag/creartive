import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/onBoardingModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class OnBoardingWidget extends StatelessWidget {
  OnBoardingModel onBoardingModel;
   OnBoardingWidget({super.key,required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(onBoardingModel.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                color: ColorManager.primary,
                fontSize: 32,
                  fontFamily: "JacquesFrancois"
              ),)
            ],
          ),

          Gap(32),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(onBoardingModel.content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: ColorManager.primary,
                  fontSize: 16,
                    fontFamily: "JacquesFrancois"
                ),),
              )
            ],
          ),
          Gap(16),
          Lottie.asset(onBoardingModel.image,
            height: size.height*0.5,
          ),
          Gap(16),


        ],
      ),
    );;
  }
}
