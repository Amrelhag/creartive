import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/ui/Home/widget/tabBar_widgets/Explore_tab.dart';
import 'package:creartive/ui/Home/widget/tabBar_widgets/for_you_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(

      initialIndex: 1,
      length: 3,
      child: Scaffold(
      backgroundColor: ColorManager.primary,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            )
          ),
          backgroundColor: ColorManager.secondary,
          title: Text("CreArtive",style: TextStyle(
          color: ColorManager.primary,fontSize: 16
        ),),),
        body:
        Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: 20,),

            TabBar(
              padding: EdgeInsets.only(right: 20,left: 20),
              dividerColor: Colors.transparent,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(text: "Explore"),
                Tab(text: "For You"),
                Tab(text: "Following"),
              ],
            ),

            Expanded(
              child: TabBarView(
                children:[

             ExploreTab(),


                  ForYouWidget(),


                  Center(child: Text("Following Page")),

            ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
