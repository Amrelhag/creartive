import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/ui/post_details/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key});
  static const String routeName="post";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.primary
              ),
              child: Icon(Icons.arrow_back_outlined)),
        ) ,
      ),
      backgroundColor: ColorManager.primary,
body: PostWidget(),
    );
  }
}
