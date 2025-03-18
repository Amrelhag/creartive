import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/Home/widget/content_card.dart';
import 'package:creartive/ui/Home/widget/tabBar_widgets/popular_Arts_widget.dart';
import 'package:flutter/material.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text("New Evants!!",style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.w400
                ),),
              ],
            ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16 ),
              child: Container(
                  child: Image.asset("assets/images/Events.png",fit: BoxFit.cover,)),
            )
          ],),


          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text("Popular Arts",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w400
                ),)
              ],
            ),
          ),

          //popular arts
          SingleChildScrollView(
              scrollDirection:Axis.horizontal,
              child:
              Row(
                children: [
                  PopularArtsWidget(),
                  PopularArtsWidget(),
                  PopularArtsWidget(),
                  PopularArtsWidget(),
                  PopularArtsWidget(),
                  PopularArtsWidget(),
                ],
              )
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.8
              ),
              itemBuilder: (context,index)=>ContentCard(content: Content.contents[index],
                  index: index),
              itemCount: Content.contents.length,
            ),
          ),
        ],
      ),
    );
  }
}
