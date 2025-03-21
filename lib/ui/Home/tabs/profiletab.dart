import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:creartive/main.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  final List<String> imagePaths = [
AssetsManager.postImage,
AssetsManager.postImage,
AssetsManager.postImage,
AssetsManager.postImage,
AssetsManager.postImage,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 100,
              color: Color.fromARGB(255, 6, 27, 64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: Colors.blueGrey), child:
                  IconButton(color: Colors.white, onPressed: (){}, icon: Icon(Icons.settings)))
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
                        backgroundImage: AssetImage(AssetsManager.addImage),
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
                Expanded(
                  child: TabBarView(
                    children: [
                      GridView.count(
                        padding: EdgeInsets.only(right: 20,left: 20),
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: imagePaths.map((path) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenImageScreen(imagePath: path),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(path, fit: BoxFit.cover),
                            ),
                          );
                        }).toList(),
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
                                      Text('2648')
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
                                      Text('4')
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
                          ),
                          SizedBox(height: 50)
                        ],
                      ),
                      Center(child: Text("You don't have any projects saved.\nTry liking any project and you will see it here!")),
                    ],
                  ),
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