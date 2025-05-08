import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/Cart_Screen/screen/widget/cart_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final Content content;
  const CartScreen(this.content);
  static const routeName="Cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: CartWidget(content: content)
    );
  }
}

class StepIndicator extends StatelessWidget {
  final int step;
  final bool isActive;

  const StepIndicator({required this.step, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: isActive ? ColorManager.secondary : Colors.grey,
      child: Text(
        "$step",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}