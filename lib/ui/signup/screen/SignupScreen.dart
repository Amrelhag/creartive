import 'package:creartive/core/FireBaseCodes.dart';
import 'package:creartive/core/StringsManager.dart';
import 'package:creartive/core/contsnts.dart';
import 'package:creartive/core/reusable_component/AssetsManager.dart';
import 'package:creartive/core/reusable_component/DialogUtils.dart';
import 'package:creartive/core/reusable_component/custom_field.dart';
import 'package:creartive/ui/Home/screen/HomeScreen.dart';
import 'package:creartive/ui/login/screen/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController repasswordController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
  }

  void _submitForm(){
    if(formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signing up...'))
      );
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.backG),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome,',
                        style: TextStyle(color: Color.fromARGB(255, 6, 27, 64)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sign up!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 6, 27, 64),
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CustomField(hint: StringsManager.UserName,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return StringsManager.empty_field;
                            }
                            return null;
                          }, ),
                    ),
                  ),

                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child:     CustomField(hint: StringsManager.emailhint,
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
                    ),
                  ), SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CustomField(hint: StringsManager.passwordhint,
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
                    ),
                  ),


                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CustomField(hint: StringsManager.confirmPassword,
                          controller: repasswordController,
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
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
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
                            createAccount();

                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Or Sign up with",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton("assets/icons/facebook.png",),
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
                      Text('Already have an account? '),
                      GestureDetector(
                        onTap:
                            () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            ),
                        child: Text(
                          'Login here!',
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

  createAccount()async {
    if (formKey.currentState!.validate()) {
      try{
        DialogUtils.showLoadingDialog(context);
        var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text);
        Navigator.pop(context);
        DialogUtils.showToast("Account Created");
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == FireBaseAuthCodes.weakPassword) {
          DialogUtils.showMessageDialog(
            context: context,
            message: 'The password provided is too weak.',
            positiveBtnTitle: "Ok",
            positiveBtnClick: (){
              Navigator.pop(context);
            },
          );

        } else if (e.code == FireBaseAuthCodes.emailAlreadyInUse) {
          DialogUtils.showMessageDialog(
            context: context,
            message: 'The account already exists for that email.',
            positiveBtnTitle: "Ok",
            positiveBtnClick: (){
              Navigator.pop(context);
            },
          );
        }
      }
      catch(e){
        Navigator.pop(context);

        DialogUtils.showMessageDialog(
          context: context,
          message: e.toString(),
          positiveBtnTitle: "Ok",
          positiveBtnClick: (){
            Navigator.pop(context);
          },
        );

        print(e.toString());
      }
    }
  }

}
