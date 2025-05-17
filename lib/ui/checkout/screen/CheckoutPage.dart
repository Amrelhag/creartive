import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/models/content.dart';
import 'package:creartive/ui/confirmation/screen/confirmation.dart';
import 'package:creartive/ui/visa/screen/visa_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutPage extends StatefulWidget {
  static const String routeName="checkout";
  final Content content;
   CheckoutPage({super.key, required this.content});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int? radioValue=1;

  @override
  Widget build(BuildContext context) {
    int total=int.parse(widget.content.price)+50;
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
                 image: DecorationImage(
                     image:AssetImage("assets/images/map.png"),fit: BoxFit.cover )
              ),

            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 32),
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

                          Radio(value: 1,
                              groupValue: radioValue,
                              onChanged: (value){
setState(() {
  radioValue=value;
});
                              }),

                          Icon(
                            Icons.money_rounded,
                            color: ColorManager.secondary,
                          ),
                          SizedBox(width: 10),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio(value: 2,
                              groupValue:radioValue,
                              onChanged: (value){
                            setState(() {
                              radioValue=value;
                            });
                              }),
                        SvgPicture.asset("assets/icons/visa.svg"),
                          SizedBox(width: 10),
                          Text(
                            "Visa",
                            style: TextStyle(
                              color: ColorManager.secondary,
                            ),
                          ),
                        ],
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
                 radioValue==1
                  ?Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ConfirmationScreen(),
                    ),
                  )
                 :Navigator.of(context).pushReplacement(
                   MaterialPageRoute(
                     builder: (context) => CreditCardApp(),
                   ),
                 );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.secondary,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  "Confirm Order",
                  style: TextStyle(color: ColorManager.primary,
                  fontSize: 24),
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
