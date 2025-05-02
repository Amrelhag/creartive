import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/main.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
import 'package:creartive/ui/Home/widget/hometabview_widget.dart';
import 'package:creartive/ui/setting/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
appBar: AppBar(backgroundColor: ColorManager.secondary,
actions: [Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: Colors.blueGrey), child:
  IconButton(color: Colors.white,
      onPressed: (){
  Navigator.of(context).pushNamed(SettingScreen.routeName);
      },
      icon: Icon(Icons.settings))),
)],
),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 100,
              color: Color.fromARGB(255, 6, 27, 64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 50,),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: InkWell(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(AssetsManager.userprofile),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImageScreen(imagePath: AssetsManager.postImage),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Amr Ali",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text("amrelhaj10@gmail.com"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Projects"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("0", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Followers"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("0", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Following"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(255, 6, 27, 64),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("follow",style: TextStyle(
                              fontSize: 20
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 45,),
                      Container(margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 225, 221, 235)
                        ),
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.mail)
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.fromLTRB(10,0,10,0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.greenAccent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Available",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TabBar(
                  padding: EdgeInsets.only(right: 20,left: 20),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: "Work"),
                    Tab(text: "About"),
                    Tab(text: "Saves"),
                  ],
                ),

                SizedBox(height: 16,),
                Expanded(
                  child: HometabbiewWidget(),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}

class FullScreenImageScreen extends StatelessWidget {
  final String imagePath;

  FullScreenImageScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios)
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain, // Ensures the image scales appropriately
        ),
      ),
    );
  }
}