import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/Home/widget/content_card.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: ColorManager.secondary,
        title: Text("CreArtive",style: TextStyle(
        color: ColorManager.primary,fontSize: 16
      ),),),
      body: Expanded(
        child: GridView.builder(
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
    );
  }
}
