import 'package:creartive/ui/Home/widget/expanded_tab_profile.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  final List<String> imagePaths = [
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              height: 100,
              color: Color.fromARGB(255, 6, 27, 64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(150), color: const Color.fromRGBO(50, 125, 139, 0.5)),
                    child: IconButton(color: Colors.white, onPressed: (){}, icon: Icon(Icons.settings))
                  )
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
                        backgroundImage: AssetImage('assets/images/addImage.png')
                      ),
                      onTap: () {},
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
                        Text("5", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Projects"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("316", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Followers"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("456", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Following"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(255, 6, 27, 64),
                        ),
                        child: Text("follow"),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
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
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(10,0,10,0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.greenAccent
                  ),
                  child: Text(
                    "Available",
                    style: TextStyle(color: Colors.black),
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
                    Tab(text: "Moodboards"),
                  ],
                ),
                ExpandedTab(imagePaths: imagePaths),
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

  const FullScreenImageScreen({super.key, required this.imagePath});

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