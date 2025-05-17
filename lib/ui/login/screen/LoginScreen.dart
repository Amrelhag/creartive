import 'package:creartive/core/FireBaseCodes.dart';
import 'package:creartive/core/StringsManager.dart';
import 'package:creartive/core/contsnts.dart';
import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:creartive/core/reusable_component/DialogUtils.dart';
import 'package:creartive/core/reusable_component/custom_field.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
import 'package:creartive/ui/reset_password/screen/reset_password_screen.dart';
import 'package:creartive/ui/signup/screen/SignupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void submitForm(){
    if (formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in...'))
      );
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Welcome back,",
                        style: TextStyle(color: Color.fromARGB(255, 6, 27, 64)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Log In!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 6, 27, 64),
                          fontWeight: FontWeight.bold,
                          fontSize: 44,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [

                      CustomField(hint: StringsManager.emailhint,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
    if (value == null || value.isEmpty) {
    return StringsManager.empty_field;
    }

    if (!RegExp(emailRegex).hasMatch(value)) {
    return StringsManager.email_not_valid;
    }
    return null;
    },
                          ),

                         SizedBox(height: 15),



                      CustomField(hint: StringsManager.passwordhint,
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          isObscured: true,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return StringsManager.empty_field;
                            }
                            if (value.length < 8) {
                              return StringsManager.at_least_eight;
                            }
                            return null;
                          }),




                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0D1B40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: (){
                              signIn();
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Or Log in with",
                      style: TextStyle(color: ColorManager.primary),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton("assets/icons/facebook.png"),
                      SizedBox(width: 10),
                      _buildSocialButton("assets/icons/google.png"),
                      SizedBox(width: 10),
                      _buildSocialButton("assets/icons/apple.png"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ",style: TextStyle(
                        color: ColorManager.primary
                      ),),
                      GestureDetector(
                        onTap:() => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            ),
                        child: Text(
                          'Signup here!',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            decorationColor: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildSocialButton(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Image.asset(assetPath, width: 40, height: 40),
        ),
      ),
    );
  }

  signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        DialogUtils.showLoadingDialog(context);
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == FireBaseAuthCodes.user_not_found) {
          DialogUtils.showMessageDialog(
            context: context,
            message: 'No user found for that email.',
            positiveBtnTitle: "Ok",
            positiveBtnClick: (){
              Navigator.pop(context);
            },
          );

        } else if (e.code ==FireBaseAuthCodes.wrong_password) {
          DialogUtils.showMessageDialog(
            context: context,
            message: 'Wrong password provided for that user.',
            positiveBtnTitle: "Ok",
            positiveBtnClick: (){
              Navigator.pop(context);
            },
          );

        }
      }
    }
  }

}