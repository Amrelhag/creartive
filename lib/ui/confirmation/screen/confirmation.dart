import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFEFF2F7), // Light grayish background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Center(
              child: Image.asset(
                "assets/images/confirm.png", // Ensure this image is in assets folder
                height: 250,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Order confirmed!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorManager.secondary, // Dark navy blue
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Wrap(
                children: [
                  Text(
                    'Your order has been placed successfully. ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF61677A), // Grayish text
                    ),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Order History',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F1035),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.secondary, // Dark navy blue
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                 Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                  },
                child: Text(
                  'Continue Shopping',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Welcome to our Community!',
              style: TextStyle(fontSize: 20, color: ColorManager.secondary),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
