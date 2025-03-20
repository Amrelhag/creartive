import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/post_details/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final Content content;
  const PostDetails({super.key,required this.content});
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
              child: IconButton(icon: Icon(Icons.arrow_back_outlined),

              onPressed: ()=>Navigator.pop(context),
              )),
        ) ,
      ),
      backgroundColor: ColorManager.primary,
body: SingleChildScrollView(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height, // Ensures full height
    ),
    child: Column(
      children: [
        PostWidget(content: content),

        SizedBox(height: 20,)
      ],
    ),
  ),
),
    );
  }
}
