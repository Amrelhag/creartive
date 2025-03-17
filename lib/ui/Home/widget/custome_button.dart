import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:flutter/material.dart';

typedef CustomButtonCallBack= String? Function(String calue);
class CustomeButton extends StatelessWidget {

  TextEditingController controller=TextEditingController();
String hint;
  CustomButtonCallBack validator;
TextInputType keyboardType;
   CustomeButton({required this.hint,
     required this.controller,required this.validator,
     required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TextFormField(
validator:(value)=> validator(value!),
          keyboardType:keyboardType ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          style:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorManager.secondary,
            ),
          decoration: InputDecoration(
              border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: ColorManager.secondary,
                )
              ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: ColorManager.secondary,
                )
            ),

            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: ColorManager.secondary,
                )
            ),


            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: ColorManager.secondary,
                )
            ),

            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),

            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: ColorManager.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w400
            )

          ),


        ),
        SizedBox(height: 16,)

      ],
    );

  }
}
