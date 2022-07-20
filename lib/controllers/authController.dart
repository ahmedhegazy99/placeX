import 'package:client/models/addressModel.dart';
import 'package:client/models/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:client/models/ownerModel.dart';
import 'package:client/models/placeModel.dart';
import 'package:client/utils/appRouter.dart';
import 'package:client/utils/utilFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'accountController.dart';
import 'databaseController.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  var _user = Rxn<User>();

  User? get owner => _user.value;

  var loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    ever(_user, (User? _) async {
      if (_ != null) {
        Get.find<AccountController>().ownerId = owner!.uid;
      }
    });

    ever(loading, (bool? val) {
      if (val != null && val)
        Get.defaultDialog(
            title: 'loading'.tr, content: CircularProgressIndicator());
      else
        Get.back();
    });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void createOwner(String ownerName, String placeName, String email,
      String phoneNumber, String password) async {
    try {
      loading.toggle();
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      _authResult.user!.updateDisplayName(ownerName);

      DateTime jd = DateTime.now();

      PlaceModel _place = PlaceModel(
        id: Uuid().v4(),
        placeName: placeName.trim(),
        joinDate: jd,
        ownerId: _authResult.user!.uid,
        address: AddressModel(),
        rooms: [],
        features: [],
        reviews: []
      );

      OwnerModel _owner = OwnerModel(
        id: _authResult.user!.uid,
        ownerName: ownerName,
        email: _authResult.user!.email,
        phoneNumber: phoneNumber,
        placeId: _place.id,
        joinDate: jd,
      );

      await Get.find<DatabaseController>().createOwner(_owner);
      await Get.find<DatabaseController>().createPlace(_place);

      Get.offAllNamed(AppRouter.mainBarRoute);
      loading.toggle();
      //Get.back();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        displayError(e: 'weak-password'.tr);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        displayError(e: 'email-already-in-use'.tr);
        print('The account already exists for that email.');
      } else
        displayError(e: e.code.tr);
    } catch (e) {
      loading.toggle();
    }
  }

  void updatePlace(
      String? placeName, String? description, String? contactEmail,
      String? contactNumber, String? facebook, String? website,
      List<RoomModel>? rooms, List<String>? features) async {
    try {
      loading.toggle();

      PlaceModel _place = PlaceModel(
        placeName: placeName!.trim(),
        description: description!.trim(),
        contactEmail: contactEmail,
        contactNumber: contactNumber,
        facebook: facebook,
        website: website,
        rooms: rooms,
        features: features,
      );

      await Get.find<DatabaseController>().updatePlace(_place);

      loading.toggle();
    } catch (e) {
      displayError(e: e);
      loading.toggle();
    }
  }

  //login function
  Future login(String email, String password) async {
    try {
      loading.toggle();
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Get.offAllNamed(AppRouter.mainBarRoute);
      loading.toggle();
    } on FirebaseAuthException catch (e) {
      loading.toggle();

      if (e.code == 'user-not-found') {
        displayError(e: 'unregistered email.'.tr);
      } else if (e.code == 'wrong-password') {
        displayError(e: 'Wrong password.'.tr);
      } else
        displayError(e: e.code.tr);
    }
  }

  //sign out function
  void signOut() async {
    try {
      loading.toggle();
      await _auth.signOut();
      Get.find<AccountController>().clear();
      Get.offAllNamed(AppRouter.loginRoute);
      loading.toggle();
    } catch (e) {
      loading.toggle();
      displayError();
    }
  }

  Future updatePassword(String password) async {
    try {
      loading.toggle();
      await _auth.currentUser!.updatePassword(password.trim()).then((val) {
        // Password has been updated.
        Get.defaultDialog(
          title: 'Done'.tr,
          content: Text(
            "Password Updated Successfully", /*style: TextStyle(color: ppmBack),*/
          ), /*backgroundColor: ppmMain, titleStyle: TextStyle(color: ppmBack)*/
        );
      }).catchError((err) {
        // An error has occurred.
        Get.defaultDialog(
          title: 'Failed'.tr,
          content: Text(
            "Can't Update Password\ntry again later", /*style: TextStyle(color: ppmBack),*/
          ), /*backgroundColor: ppmLight, titleStyle: TextStyle(color: ppmBack)*/
        );
      });

      loading.toggle();
      Get.back();
    } catch (e) {
      loading.toggle();
      displayError();
    }
  }

  Future forgotPass(String email) async {
    try {
      loading.toggle();
      await _auth.sendPasswordResetEmail(email: email).then((val) {
        // reset email has been sent.
        Get.defaultDialog(
          title: 'Done'.tr,
          content: Text(
            "/Sent Password Reset Link to $email", /*style: TextStyle(color: ppmBack),*/
          ), /*backgroundColor: ppmMain, titleStyle: TextStyle(color: ppmBack)*/
        );
      }).catchError((err) {
        // An error has occured.
        Get.defaultDialog(
          title: 'Failed'.tr,
          content: Text(
            "Can't send email\ntry again later", /*style: TextStyle(color: ppmBack),*/
          ), /*backgroundColor: ppmLight, titleStyle: TextStyle(color: ppmBack)*/
        );
      });

      loading.toggle();
      Get.back();
    } catch (e) {
      loading.toggle();
      displayError();
    }
  }
}
