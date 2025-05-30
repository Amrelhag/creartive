import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:flutter/material.dart';

class PopularArtsWidget extends StatelessWidget {
  String Pimage;
   PopularArtsWidget({super.key,required this.Pimage});

  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Makes the image rounded
        child: Container(
          width: 110,
          height: 110,
          child: Image.asset(
            Pimage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
