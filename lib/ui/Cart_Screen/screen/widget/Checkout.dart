import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/ui/Cart_Screen/screen/widget/Confirmation.dart';
import 'package:creartive/models/content.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final Content content;
  const CheckoutPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    int total=int.parse(content.price)+50;
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout", style: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child: StepIndicator(step: 1, isActive: true)),
                Expanded(
                  child: Divider(
                    thickness: 5,
                    color: ColorManager.secondary,
                  ),
                ),
                Expanded(child: StepIndicator(step: 2, isActive: true)),
                Expanded(
                  child: Divider(
                    thickness: 5,
                    color: ColorManager.secondary,
                  ),
                ),
                Expanded(child: StepIndicator(step: 3, isActive: true)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined, color: Colors.deepPurple),
                SizedBox(width: 5),
                Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text("to be input**", style: TextStyle(color: Colors.deepPurple)),
            SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  )
                ]
              ),
              child: Center(
                child: Icon(Icons.map, size: 50, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.credit_card,
                        color: ColorManager.secondary,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Payment method",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.secondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.money_rounded,
                            color: ColorManager.secondary,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Cash",
                            style: TextStyle(
                              color: ColorManager.secondary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "$total LE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ConfirmationScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.secondary,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  "Confirm Order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
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