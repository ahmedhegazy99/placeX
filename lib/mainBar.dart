import 'package:client/controllers/mainBarController.dart';
import 'package:client/screens/account.dart';
import 'package:client/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/constants.dart';
import 'controllers/authController.dart';

class MainBar extends GetWidget<MainBarController> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Places(),
      Account(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: backW,
        foregroundColor: mainP,
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        actions: [
          //Icon(Icons.more_vert),

          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: mainP,),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: 1,
                child: Text(
                  "settings".tr,
                ),
              ),
              PopupMenuItem(
                value: 0,
                child: Text(
                  "logout".tr,
                ),
              ),
            ],
            onSelected: (result) async {
              switch(result) {
                case 0: {
                  Get.find<AuthController>().signOut();
                }
                break;

                case 1: {
                  //Get.to(Settings());
                }
                break;
              }
            },
          ),
          //SizedBox(width: 10)
        ],
        title: Center(
          child:
          Text(
            "PlaceX",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "englishBebas",
                color: mainP,
                fontSize: 24),
          ),
          /*Image.asset(
            'assets/images/Hlogo.png',
            fit: BoxFit.contain,
            height: 100,
            width: 100,
          ),*/
        ),
        centerTitle: true,
        elevation: 0,
        /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),*/
      ),
      body: SafeArea(child: Obx(() => tabs[controller.currentIndex])),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex,
          type: BottomNavigationBarType.fixed,
          //backgroundColor: backW,
          //backgroundColor: mainP,
          iconSize: 24,
          //unselectedFontSize: 20,
          //unselectedItemColor: Colors.white,
          //selectedItemColor: secondY,
          //selectedItemColor: mainP,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'home'.tr,
              //backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: 'place'.tr,
              //backgroundColor: Colors.black
            ),
          ],
          onTap: (index) {
            controller.userId.value = null;
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
