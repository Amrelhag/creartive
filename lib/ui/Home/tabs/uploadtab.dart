import 'dart:io';

import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/ui/Home/widget/custome_button.dart';
import 'package:creartive/ui/Home/widget/inputpost.dart';
import 'package:creartive/ui/Home/widget/upload_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadTab extends StatefulWidget {
   UploadTab({super.key});

  @override
  State<UploadTab> createState() => _UploadTabState();
}

class _UploadTabState extends State<UploadTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorManager.primary,
      appBar: AppBar(backgroundColor: ColorManager.secondary,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context,"Home");
              setState(() {

              });
            },
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primary
                ),
                child: Icon(Icons.arrow_back_outlined)),
          ),
        ),
      ),

      body:UploadWidget(onSubmit: (){
        setState(() {

        });
      }),





    );
  }
}
