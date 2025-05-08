import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/Cart_Screen/screen/screen/Cart_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Content content;
   PostWidget({super.key,required this.content});

  @override
  Widget build(BuildContext context) {
    return
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
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
              padding: const EdgeInsets.symmetric(vertical:25 ),
              child: Column(
                children: [
                  Container(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    color: ColorManager.primary
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: content.image is String
                          ? Image.asset(content.image, fit: BoxFit.cover)
                          : Image.file(content.image, fit: BoxFit.cover),
                    ),
                  ),

                  const SizedBox(height: 10), // Spacing

                  // Title and Price
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        content.title,
                        style: TextStyle(
                          color: ColorManager.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        "${content.price}",
                        style: TextStyle(
                          color: ColorManager.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    child: Center(
                      child: Text(
                        content.description,
                        style: TextStyle(
                          color: ColorManager.secondary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(content)));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.secondary,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6),
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    color: ColorManager.primary,
                    fontSize: 24,fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),

        SizedBox(height: 20,)
          ],
               ),
       );
  }
}
