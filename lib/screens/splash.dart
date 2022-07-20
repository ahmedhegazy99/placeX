import 'package:client/components/constants.dart';
import 'package:client/controllers/authController.dart';
import 'package:client/utils/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  void navigate() async {
    var controller = Get.find<AuthController>();
    await Future.delayed(Duration(seconds: 3));
    //Get.offAllNamed(AppRouter.mainBarRoute);
    if (controller.owner?.uid != null)
      Get.offAllNamed(AppRouter.mainBarRoute);
    else
      Get.offAllNamed(AppRouter.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    navigate();
    return Container(
      color: Colors.white,
      child: Center(
          child: SizedBox(
              height: 300.0, child:
            //Image.asset("assets/images/Hlogo.png")
            Text(
              "PlaceX",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "englishBebas",
                color: mainP,
                fontSize: 60,
                decoration: TextDecoration.none,
              ),
            ),
          )),
    );
  }
}
