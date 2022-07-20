import 'package:client/components/constants.dart';
import 'package:client/components/roundedButton.dart';
import 'package:client/components/roundedInputField.dart';
import 'package:client/components/xCard.dart';
import 'package:client/components/xInputField.dart';
import 'package:client/controllers/authController.dart';
import 'package:client/utils/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backW,
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(left: 12, top: 48, right: 12, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "placeX",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "englishBebas",
                    color: mainP,
                    fontSize: 32),
              ),
            ),
            SizedBox(height: size.height * 0.1),
            Expanded(
              child: SingleChildScrollView(
                child: XCard(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: size.height * 0.03),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "englishBebas",
                              color: mainP,
                              fontSize: 24),
                        ),
                        SizedBox(height: size.height * 0.02),
                        RoundedInputField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.person,
                          hintText: "Email",
                          controller: emailController,
                        ),
                        RoundedInputField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an password' : null,
                          //color: Colors.white,
                          //textColor: Colors.black,
                          obscureText: true,
                          icon: Icons.lock,
                          hintText: "Password",
                          controller: passwordController,
                        ),
                        RoundedButton(
                            text: "login",
                            press: () async {
                              //to sign in with email and password
                              if (_formKey.currentState!.validate()) {
                                controller.login(emailController.text,
                                    passwordController.text);
                              }
                            }),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRouter.registerRoute);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24, top: 24),
                              child: Text(
                                "you don't have an account? Sign Up.",
                                style: TextStyle(color: mainP, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
