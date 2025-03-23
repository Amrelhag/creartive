import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/Home/widget/content_card.dart';
import 'package:flutter/material.dart';
import 'package:creartive/models/content.dart';

class SearchTab extends StatefulWidget {
  const SearchTab ({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {

  List<Content> filterList=[];
  String searchValue="";

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
body: GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: (){
    FocusScope.of(context).unfocus();
  },
  child: Column(
    children: [
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
          child: TextField(
            autofocus: true,
            onChanged: (value){
              setState(() {
  searchValue=value;
  searchTitle(value);
              });
            },
            style: TextStyle(
              fontSize: 16,color: ColorManager.secondary,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorManager.primary,
              hintText: "Search..",
              hintStyle: TextStyle(
                fontSize: 16,fontWeight: FontWeight.w700,
                color: ColorManager.secondary,

              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorManager.primary,
                  )
              ),
                focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorManager.primary,
                    )
                )
            ),
          ),
        ),
      ),


      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.8
            ),
            itemBuilder: (context,index)=>
        ContentCard(content:
        searchValue.isNotEmpty
           ?filterList[index]
        :FixedList.fixedContent[index],index: index,

        ),

            itemCount:
            searchValue.isNotEmpty
            ?filterList.length
            :FixedList.fixedContent.length,
          ),
        ),
      ),


    ],
  ),
),
    );

  }
  searchTitle(String search){
    filterList=[];
    filterList= FixedList.fixedContent.where((element)=>
    element.title.toLowerCase().contains(search.toLowerCase())
        ||element.title.contains(search.toLowerCase())).toList();

  }
}