import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  String hint;
  TextEditingController controller;
  TextInputType keyboardType;
  bool isObscured;
  String? Function(String?) validator;

   CustomField({super.key,
    required this.hint,
    required this.controller,
    required this.keyboardType,
    this.isObscured = false,
    required this.validator,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}
bool passwordToggle = true;

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isObscured?passwordToggle:false,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.isObscured
            ? IconButton(
          onPressed: () {
            setState(() {
              passwordToggle = !passwordToggle;
            });
          },
          icon: Icon(
            passwordToggle
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            size: 24,
            color: Colors.black,
          ),
        )
            : null,

      ),
      validator: widget.validator,



    );
  }
}
