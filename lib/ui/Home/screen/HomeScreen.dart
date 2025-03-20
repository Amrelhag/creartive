import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/ui/Home/tabs/carttab.dart';
import 'package:creartive/ui/Home/tabs/home.dart';
import 'package:creartive/ui/Home/tabs/profiletab.dart';
import 'package:creartive/ui/Home/tabs/searchtab.dart';
import 'package:creartive/ui/Home/tabs/uploadtab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key,});
  static const String routeName="Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex=0;
  List<Widget> tabs=[
   HomeTab(),
    SearchTab(),
    UploadTab(),
    CartTab(),
    ProfileTab(),
  ];




  @override
  Widget build(BuildContext context) {


    return Scaffold(backgroundColor:(ColorManager.secondary),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index){
          setState(() {
            selectedIndex=index;
          });
        },
          backgroundColor: ColorManager.primary,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
shadowColor: ColorManager.secondary,
          destinations:
         [ NavigationDestination(
           icon: SvgPicture.asset(AssetsManager.home,
             colorFilter:ColorFilter.mode(ColorManager.unselectediconColor, BlendMode.srcIn) ,),
           label: "Home",
         // design of selected icon
         selectedIcon:SvgPicture.asset(AssetsManager.home,
           colorFilter:ColorFilter.mode(ColorManager.selectediconColor, BlendMode.srcIn) ,) ,
         ),

//search icon
           NavigationDestination(
             icon: SvgPicture.asset(AssetsManager.search,
               colorFilter:ColorFilter.mode(ColorManager.unselectediconColor, BlendMode.srcIn) ,),
             label: "Search",
             // design of selected icon
             selectedIcon:SvgPicture.asset(AssetsManager.search,
               colorFilter:ColorFilter.mode(ColorManager.selectediconColor, BlendMode.srcIn) ,) ,
           ),

//upload icon
            NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.upload,
                 ),
              label: "",
              // design of selected icon
              selectedIcon:SvgPicture.asset(AssetsManager.upload,) ,
            ),

//cart icon
            NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.cart,
                colorFilter:ColorFilter.mode(ColorManager.unselectediconColor, BlendMode.srcIn) ,),
              label: "Cart",
              // design of selected icon
              selectedIcon:SvgPicture.asset(AssetsManager.cart,
                colorFilter:ColorFilter.mode(ColorManager.selectediconColor, BlendMode.srcIn) ,) ,
            ),

// profile icon
            NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.user,
                colorFilter:ColorFilter.mode(ColorManager.unselectediconColor, BlendMode.srcIn) ,),
              label: "Profile",
              // design of selected icon
              selectedIcon:SvgPicture.asset(AssetsManager.user,
                colorFilter:ColorFilter.mode(ColorManager.selectediconColor, BlendMode.srcIn) ,) ,
            ),

    ]
      ),

      body: tabs[selectedIndex],
    );
  }
}
