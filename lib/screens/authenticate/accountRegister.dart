///signup page for the first open to register a coworking space
///with *username *userContactNumber *userContactEmail *BusinessName *password
///then user are directed to another confirmation or finish page to fill
///business details and **click finish for review or save to save its entered data
///until complete and if all data filled disable save button
///**when click review an request are set to admins dashboard to approve the new business

import 'package:client/components/constants.dart';
import 'package:client/components/roundedButton.dart';
import 'package:client/components/roundedInputField.dart';
import 'package:client/components/xCard.dart';
import 'package:client/components/xInputField.dart';
import 'package:client/controllers/authController.dart';
import 'package:client/utils/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountRegister extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userName = TextEditingController();
  final TextEditingController spaceName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(left: 12, top: 48, right: 12, bottom: 6),
        child: Column(
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
            SizedBox(height: size.height * 0.04),
            Expanded(
              child: SingleChildScrollView(
                child: XCard(
                  height: size.height * 0.95,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: size.height * 0.03),
                        Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "englishBebas",
                              color: mainP,
                              fontSize: 24),
                        ),
                        SizedBox(height: size.height * 0.02),

                        RoundedInputField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Username' : null,
                          keyboardType: TextInputType.name,
                          hintText: "Username",
                          icon: Icons.person,
                          controller: userName,
                        ),
                        RoundedInputField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Space Name' : null,
                          keyboardType: TextInputType.name,
                          hintText: "Space Name",
                          icon: Icons.add_business,
                          controller: spaceName,
                        ),

                        RoundedInputField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an Email' : null,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Email",
                          icon: Icons.mail,
                          controller: email,
                        ),
                        RoundedInputField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter phone number' : null,
                          keyboardType: TextInputType.phone,
                          hintText: "Phone Number",
                          icon: Icons.phone,
                          controller: phoneNumber,
                        ),

                        //SizedBox(height: size.height * 0.03),

                        RoundedInputField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an password' : null,
                          color: Colors.white,
                          textColor: Colors.black,
                          obscureText: true,
                          icon: Icons.lock,
                          hintText: "Password",
                          controller: password,
                        ),

                        //SizedBox(height: size.height * 0.03),

                        RoundedInputField(
                          validator: (val) =>
                              val!.isEmpty ? "Password didn't match" : null,
                          color: Colors.white,
                          textColor: Colors.black,
                          obscureText: true,
                          icon: Icons.lock,
                          hintText: "Confirm Password",
                          controller: confirmPassword,
                        ),

                        SizedBox(height: size.height * 0.02),

                        RoundedButton(
                            text: "sign up",
                            press: () async {
                              if (_formKey.currentState!.validate() &&
                                  password.text == confirmPassword.text) {
                                print("form validated");
                                controller.createOwner(
                                    userName.text,
                                    spaceName.text,
                                    email.text,
                                    phoneNumber.text,
                                    password.text);
                              }
                            }),

                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRouter.loginRoute);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12, top: 24),
                              child: Text(
                                "Already have an account? Login.",
                                style: TextStyle(color: mainP, fontSize: 12),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.04),
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
