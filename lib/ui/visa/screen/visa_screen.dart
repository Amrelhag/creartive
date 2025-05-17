import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/ui/confirmation/screen/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';


class CreditCardApp extends StatelessWidget {
  const CreditCardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CreditCardPage();
  }
}

class CreditCardPage extends StatefulWidget {
  static const String routeName="credit";
  const CreditCardPage({Key? key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  bool showBackView = false;

  @override
  void dispose() {
    cardNumberController.dispose();
    nameController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'credit card',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black54),
            onPressed: () {
             Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Custom Credit Card UI
                _buildCreditCardUI(),
                const SizedBox(height: 30),
                // Custom Form Fields
                _buildFormFields(),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ConfirmationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.secondary,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text("Next", style: TextStyle(color: Colors.white,
                      fontSize: 24)),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreditCardUI() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showBackView = !showBackView;
        });
      },
      child: Container(
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFA9329D), Color(0xFF7B1FA2)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: showBackView ? _buildCardBack() : _buildCardFront(),
      ),
    );
  }

  Widget _buildCardFront() {
    return Stack(
      children: [
        // Card Background Pattern
        Positioned.fill(
          child: Opacity(
            opacity: 0.1,
            child: CustomPaint(
              painter: CardPatternPainter(),
            ),
          ),
        ),
        // Card Content
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bank Name
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'BANK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Credit Card Chip
              Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 15),
              // Card Number
              Text(
                cardNumberController.text.isEmpty
                    ? '1234 5678 1234 5678'
                    : cardNumberController.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              // Card Holder Name and Expiry Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'NAME SURNAME',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        nameController.text.isEmpty ? 'NAME SURNAME' : nameController.text.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'MM/YY',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        expiryDateController.text.isEmpty ? 'MM/YY' : expiryDateController.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardBack() {
    return Stack(
      children: [
        // Black strip
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: Container(
            height: 40,
            color: Colors.black,
          ),
        ),
        // CVV
        Positioned(
          top: 90,
          right: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              cvvController.text.isEmpty ? '***' : cvvController.text.padRight(3, '*'),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
        // CVV Label
        Positioned(
          top: 90,
          right: 80,
          child: const Text(
            'CVV',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Signature strip
        Positioned(
          top: 120,
          left: 20,
          right: 20,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: Colors.black,
                thickness: 1,
                height: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        // Card Number Field
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.credit_card, color: Colors.grey),
                hintText: 'Card Number',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberFormatter(),
              ],
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        // Full Name Field
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.person_outline, color: Colors.grey),
                hintText: 'Full Name',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
              ],
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        // Expiry Date and CVV in a row
        Row(
          children: [
            // Expiry Date Field
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: expiryDateController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.date_range, color: Colors.grey),
                      hintText: 'MM/YY',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      ExpiryDateFormatter(),
                    ],
                    onTap: () {
                      setState(() {
                        showBackView = false;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            // CVV Field
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: cvvController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.lock_outline, color: Colors.grey),
                      hintText: 'CVV',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    obscureText: true,
                    onTap: () {
                      setState(() {
                        showBackView = true;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatCardNumber(String cardNumber) {
    // This is handled by CardNumberFormatter now
    return cardNumber;
  }
}

// Custom Painter for credit card background pattern
class CardPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Draw some curved lines for decoration
    final path = Path();
    path.moveTo(size.width * 0.8, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.5,
        size.width * 0.8, size.height * 0.8
    );

    final path2 = Path();
    path2.moveTo(size.width * 0.7, size.height * 0.1);
    path2.quadraticBezierTo(
        size.width * 0.9, size.height * 0.5,
        size.width * 0.7, size.height * 0.9
    );

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CardPatternPainter oldDelegate) => false;
}

// Custom formatter for card number
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != inputData.length) {
        buffer.write(' ');
      }
    }

    String string = buffer.toString();
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

// Custom formatter for expiry date
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int nonZeroIndex = i + 1;
      if (nonZeroIndex == 2 && nonZeroIndex != inputData.length) {
        buffer.write('/');
      }
    }

    String string = buffer.toString();
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}