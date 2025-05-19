import 'package:flutter/material.dart';

class ChattBubble extends StatelessWidget {
  final String message;
  const ChattBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Text(message, style: TextStyle(fontSize: 16)),
    );
  }
}
