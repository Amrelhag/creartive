import 'dart:io';

import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:flutter/material.dart';

class InputPost extends StatefulWidget {

  final TextEditingController titlecontroler;
  final TextEditingController pricecontroler;
  final TextEditingController descreptioncontroler;
  File? image;
Function onclick;
   InputPost({required this.titlecontroler,required this.pricecontroler,
    required this.descreptioncontroler,required this.image,required this.onclick});

  @override
  State<InputPost> createState() => _InputPostState();
}

class _InputPostState extends State<InputPost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()async{
            await  widget.onclick();
            setState(() {

            });
            },
            child: SizedBox(
              width:MediaQuery.of(context).size.width*0.4 ,
              height:MediaQuery.of(context).size.height*0.3 ,
              child: AspectRatio(aspectRatio: 0.6,
              child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,color: ColorManager.secondary
                    ),
                    color: ColorManager.primary
                ),
                child:  widget.image == null
               ? Image.asset("assets/images/addImage.png")
                    :Image.file(widget.image!,fit: BoxFit.cover,),
              ),

              ),
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                    valueListenable: widget.titlecontroler,
                    builder: (context, value, child)
                    =>Text(
                        value.text.isEmpty
                            ? "Title"
                    :value.text ,style:TextStyle(
                      fontSize: 16,
                      color: ColorManager.secondary,
                      fontWeight: FontWeight.w400
                    ) ,
                    ) ,),

                Divider(color: ColorManager.secondary,
                indent: 20,endIndent: 20,),

                ValueListenableBuilder(
                  valueListenable: widget.descreptioncontroler,
                  builder: (context, value, child)
                  =>Text(
                    value.text.isEmpty
                        ? "Description..."
                        :value.text ,style:TextStyle(
                      fontSize: 16,
                      color: ColorManager.secondary,
                      fontWeight: FontWeight.w400
                  ) ,
                  ) ,),

                Divider(color: ColorManager.secondary,
                  indent: 20,endIndent: 20,),

                ValueListenableBuilder(
                  valueListenable: widget.pricecontroler,
                  builder: (context, value, child)
                  =>Text(
                    value.text.isEmpty
                        ? "LE"
                        :value.text ,style:TextStyle(
                      fontSize: 16,
                      color: ColorManager.secondary,
                      fontWeight: FontWeight.w400
                  ) ,
                  ) ,)
              ],
            ),
          ))
        ],
      ),
    );
  }
}
