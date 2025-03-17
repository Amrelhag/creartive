import 'dart:io';

import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/Home/widget/custome_button.dart';
import 'package:creartive/ui/Home/widget/inputpost.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadWidget extends StatefulWidget {
  final VoidCallback onSubmit;
   UploadWidget({super.key,required this.onSubmit});

  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}


class _UploadWidgetState extends State<UploadWidget> {
  final titlecontroler= TextEditingController();
  final pricecontroler= TextEditingController();
  final descreptioncontroler= TextEditingController();
  File? image;
  final formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  GestureDetector
      (onTap: (){
      FocusScope.of(context).unfocus();
    },
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          reverse: true,
          child: Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20,),

                InputPost(
                  titlecontroler: titlecontroler,
                  pricecontroler: pricecontroler,
                  descreptioncontroler: descreptioncontroler,
                  image: image,
                  onclick: ()async{ImagePicker imagepicker=ImagePicker();
                  var file=await imagepicker.pickImage(source: ImageSource.gallery,);
                  if(file!=null){

                    setState(() {
                      image=File(file.path);
                    });
                    widget.onSubmit();
                  }

                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Divider(color: Colors.black,indent: 75,endIndent: 75,),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:24 ),
                  child: Expanded(
                    child: Column(
                      children: [
                        CustomeButton(
                          hint: "Enter title",
                          controller: titlecontroler,
                          keyboardType: TextInputType.text ,
validator: (value)=>value.isEmpty?" Enter title":null,
                        ),

                        CustomeButton(

                          hint: "Enter Description",
                          controller: descreptioncontroler,
                          keyboardType: TextInputType.text ,
                          validator: (value)=>value.isEmpty?"Enter Description":null,
                        ),

                        CustomeButton(

                          hint: "Enter Price ",
                          controller: pricecontroler,
                          keyboardType: TextInputType.number ,
                          validator: (value)=>value.isEmpty?"Enter Price":null,
                        ),

                        SizedBox(height: 40,),


                        //Fill button ....submit
                        FilledButton(
                            onPressed: (){
                                    if(formkey.currentState!.validate()){
                                      if(image==null){
                                        return;
                                      }
                                    }
                                    Content.contents.add(
                                        Content(titlecontroler.text,
                                            descreptioncontroler.text,
                                            image!,
                                            pricecontroler.text));
                                    widget.onSubmit();
Navigator.pushReplacementNamed(context,"Home");


                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: ColorManager.secondary,
                                foregroundColor: ColorManager.primary,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Submit"),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
