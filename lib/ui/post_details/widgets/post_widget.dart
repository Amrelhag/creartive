import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:flutter/cupertino.dart';

class PostWidget extends StatelessWidget {
   PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Image.asset("assets/images/userimage.png"),
                  Text("  Marcos Emad",style: TextStyle(
                    color: ColorManager.secondary,
                    fontSize: 16,fontWeight: FontWeight.w500
                  ),),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical:60 ),
              child: Column(
                children: [
                  Container(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    color: ColorManager.primary
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/postimage.png",fit: BoxFit.cover,),
                    ),
                  )
                ],
              ),
            ),

            Spacer()
          ],
        ),
      ),
    );
  }
}
