import 'package:flutter/material.dart';
import 'package:creartive/ui/Home/tabs/profiletab.dart';

class ExpandedTab extends StatelessWidget {
  const ExpandedTab({
    super.key,
    required this.imagePaths,
  });

  final List<String> imagePaths;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          if (imagePaths.isEmpty) Center(
              child: Text("There aren't any images.",),
            ) else GridView.count(
            padding: EdgeInsets.only(right: 20,left: 20),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: imagePaths.map((path) => InkWell(
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
              )).toList(),
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
    );
  }
}