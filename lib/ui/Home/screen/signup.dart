import 'dart:async';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:creartive/ui/Home/screen/login.dart';
import 'package:creartive/ui/Home/screen/WelcomeScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signing up...')),
      );
      Timer(Duration(seconds: 2),(){Navigator.pushReplacementNamed(context, HomeScreen.routeName);});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.white,
          onPressed: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>WelcomeScreen()));},
          icon: Icon(Icons.arrow_back_ios_new_outlined)
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD83F5B), Color(0xFFEAEFF5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Sign up!",
                    style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(_usernameController, "User Name", false),
                  _buildTextField(_emailController, "Email Access", false, isEmail: true),
                  _buildTextField(_passwordController, "Enter your password", true),
                  _buildTextField(_confirmPasswordController, "Confirm Password", true, isConfirm: true),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0D1B40),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: _submitForm,
                      child: Text("Sign Up", style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(child: Text("Or Sign up with", style: TextStyle(color: Colors.black))),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton("assets/facebook.png"),
                      SizedBox(width: 10,),
                      _buildSocialButton("assets/google.png"),
                      SizedBox(width: 10,),
                      _buildSocialButton("assets/apple.png"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? Login here!",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          decorationColor: Colors.blueAccent,
                          decoration: TextDecoration.underline
                        ),
                        recognizer: TapGestureRecognizer() ..onTap = () => Navigator.push(
                          context,MaterialPageRoute(builder: (context) => LoginScreen()),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, bool isPassword, {bool isEmail = false, bool isConfirm = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          }
          if (isEmail && !RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+\$').hasMatch(value)) {
            return 'Enter a valid email';
          }
          if (isConfirm && value != _passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>HomeScreen()));},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Image.asset(assetPath, width: 40, height: 40)
        ),
      ),
    );
  }
}