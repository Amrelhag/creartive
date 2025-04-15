import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:flutter/material.dart';

class RecentlyWidget extends StatelessWidget {
  String recentlyValue='';
   RecentlyWidget({super.key,required this.recentlyValue});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(16),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.primary,
      ) ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.access_time_outlined),
            Text(recentlyValue),

          ],
        ),
      ),
    );
  }
}
