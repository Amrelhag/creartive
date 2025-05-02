import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

class DialogUtils{
  static showLoadingDialog(BuildContext context){
    showDialog(context: context, builder:(context)=>AlertDialog(
      content: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Loading...",style: TextStyle(
            color: ColorManager.selectediconColor
          ),),
          Gap(10),
          CircularProgressIndicator(color:ColorManager.selectediconColor,)
        ],
      ),
    ) );
  }

  static showMessageDialog(
      {required BuildContext context,
        required String message,
        required String positiveBtnTitle,
        required void Function() positiveBtnClick,
        String? negativeBtnTitle,
        void Function()? negativeBtnClick,
      }
      ){
    showDialog(context: context, builder:(context)=>AlertDialog(
      content: Text(message,style: TextStyle(
        color: ColorManager.selectediconColor
      )),
      actions: [
        TextButton(onPressed: positiveBtnClick,
            child: Text(positiveBtnTitle)),

        if(negativeBtnTitle!=null)
          TextButton(onPressed: negativeBtnClick,
              child: Text(negativeBtnTitle))


      ],
    ) );
  }

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.secondary,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  }
