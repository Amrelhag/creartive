import 'dart:io';

import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/Home/tabs/profiletab.dart';
import 'package:flutter/material.dart';

class HometabbiewWidget extends StatefulWidget {
   HometabbiewWidget({super.key});

  @override
  State<HometabbiewWidget> createState() => _HometabbiewWidgetState();
}

class _HometabbiewWidgetState extends State<HometabbiewWidget> {
  final List<String> imagePaths = [

  ];

void initState(){
  super.initState();
  imagePaths.addAll(Content.contents.map((content)=>
  content.image is File ? content.image.path.toString() :
  content.image.toString()).cast<String>());

}

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        GridView.count(
          padding: EdgeInsets.only(right: 20,left: 20),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children:
          imagePaths.isNotEmpty
          ?imagePaths.map((path) {
            return InkWell(
              onTap: () {
                print("image path : $path");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImageScreen(imagePath:path ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: path.startsWith("/")
                    ? Image.file(File(path), fit: BoxFit.cover) // Local file
                    : Image.asset(path, fit: BoxFit.cover),
              ),
            );
          }).toList() : [Text("Empty")]

          ,
        ),
        ListView(
          padding: EdgeInsets.only(right: 20,left: 20),
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                  decoration: BoxDecoration(
                    color:  const Color.fromARGB(255, 224, 226, 230),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Project views',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text('0')
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 50,),
                Container(
                  padding: EdgeInsets.fromLTRB(40,7,40,7),
                  decoration: BoxDecoration(
                    color:  const Color.fromARGB(255, 224, 226, 230),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Deals',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text('0')
                        ],
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Text('Feedback'),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.fromLTRB(10,100,10,100),
              decoration: BoxDecoration(
                  color:  const Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("There is no feedback yet!",style: TextStyle(
                fontSize: 16,color: ColorManager.secondary
              ),)),
            ),
            SizedBox(height: 50)
          ],
        ),
        Center(child: Text("You don't have any projects saved.\nTry liking any project and you will see it here!")),
      ],
    );
  }
}
