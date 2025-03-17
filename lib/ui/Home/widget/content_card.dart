import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/post_details/screen/PostDetails.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  Content content;
  int index;
   ContentCard({required this.content,required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: GestureDetector(onTap: (){

        Navigator.push(context,
          MaterialPageRoute(builder: (context) => PostDetails()),
        );
      },
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Expanded(child: Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16)
              ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(content.image,
                    fit:BoxFit.cover ,width: double.infinity,),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
