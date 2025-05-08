import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/Cart_Screen/screen/widget/Checkout.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final Content content;
  const CartWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    int total=int.parse(content.price)+50;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: StepIndicator(step: 1, isActive: true)),
              Expanded(child: Divider(thickness: 5,color: ColorManager.secondary),),
              Expanded(child: StepIndicator(step: 2, isActive: true)),
              Expanded(child: Divider(thickness: 5, color: Colors.grey)),
              Expanded(child: StepIndicator(step: 3, isActive: false)),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),spreadRadius: 2,blurRadius: 5)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: content.image is String
                        ? Image.asset(content.image, fit: BoxFit.cover)
                        : Image.file(content.image, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${content.price} LE",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorManager.secondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.secondary,
                ),
              ),
              Text(
                "50 LE",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorManager.secondary,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.secondary,
                ),
              ),
              Text(
                "$total LE",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.secondary,
                ),
              ),
            ],
          ),
          Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CheckoutPage(content: content,)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.secondary,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text("Next", style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}