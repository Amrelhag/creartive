import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        title: Text("  Cart",style: TextStyle(
          fontSize: 24,color: ColorManager.secondary
        ),),
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primary
              ),
              child: IconButton(icon: Icon(Icons.arrow_back_outlined),

                onPressed: ()=>Navigator.pop(context),
              )),
        ) ,
      ),


      body: Column(
        children: [
          Center(
            child: Container(
              child: Lottie.asset(AssetsManager.emptyCart),
            ),
          ),
          
          SizedBox(height: 20,),
          
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Cart looks Empty!",style: TextStyle(
                fontSize: 20,color: ColorManager.secondary,
              ),)
            ],
          ),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Shop Now!",style: TextStyle(
                fontSize: 20,color: ColorManager.secondary,
              ),)
            ],
          ),
        ],
      ),
      
      
    );
  }
}
