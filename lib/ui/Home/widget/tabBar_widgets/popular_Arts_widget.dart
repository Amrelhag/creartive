import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:flutter/material.dart';

class PopularArtsWidget extends StatelessWidget {
  const PopularArtsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Makes the image rounded
        child: Container(
          width: 100,
          height: 100,
          child: Image.asset(
            AssetsManager.fixedImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
