import 'dart:developer';
import 'dart:io';
import 'package:client/models/ownerModel.dart';
import 'package:client/models/placeModel.dart';
import 'package:client/models/reviewModel.dart';
import 'package:client/utils/utilFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'authController.dart';

class DatabaseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  var places = RxList<PlaceModel>();
  var newPosts = Rxn<QuerySnapshot>();
  var loading = false.obs;
  var uploading = false.obs;

  @override
  void onInit() {
    getPlaces();
    super.onInit();
  }

  @override
  void onReady() {
    newPosts.bindStream(_firestore.collection('places').snapshots());
    ever(newPosts, (dynamic newVal) {
      if (newVal!.docs.length != places.length) {
        getPlaces(update: true);
      }
    });
  }

  Future<bool> createOwner(OwnerModel owner) async {
    try {
      await _firestore.collection('owners').doc(owner.id).set(owner.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateOwner(OwnerModel owner) async {
    try {
      _firestore
          .collection('owners')
          .doc(owner.id)
          .update(owner.toJson())
          .then((value) => print("Owner Updated"))
          .catchError((error) {
        print("Failed to update owner: $error");
        displayError();
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<OwnerModel> getOwner(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('owners').doc(uid).get();
      if (documentSnapshot.exists) {
        return OwnerModel.fromJson(
            documentSnapshot.data()! as Map<String, dynamic>);
      } else {
        print("User Not Found");
        throw Exception("User Not Found");
      }
    } catch (e) {
      Get.find<AuthController>().signOut();
      return OwnerModel();
    }
  }

  Future<bool> createPlace(PlaceModel place) async {
    try {
      await _firestore.collection('places').doc(place.id).set(place.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updatePlace(PlaceModel place) async {
    try {
      log("start update place database");
      _firestore
          .collection('places')
          .doc(place.id)
          .update(place.toJson())
          .then((value) => print("Place Updated"))
          .catchError((error) {
        print("Failed to update place: $error");
        log("Failed to update place: $error");
        displayError();
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<PlaceModel> getPlace(String pid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('places').doc(pid).get();
      if (documentSnapshot.exists) {
        return PlaceModel.fromJson(
            documentSnapshot.data()! as Map<String, dynamic>);
      } else {
        print("Place Not Found");
        throw Exception("Place Not Found");
      }
    } catch (e) {
      Get.find<AuthController>().signOut();
      return PlaceModel();
    }
  }

  Stream<List<PlaceModel>> getPlaces({bool update = false}) {
    return _firestore
        .collection('places')
        .where('blocked', isEqualTo: false)
        .orderBy('joinDate', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PlaceModel.fromJson(doc.data()))
            .toList());
  }

  Stream<List<ReviewModel>> getPlaceReviews(String placeId) {
    return _firestore
        .collection('reviews')
        .where('placeId', isEqualTo: placeId)
        .orderBy('modified', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ReviewModel.fromJson(doc.data()))
            .toList());
  }

  Future<bool> uploadPlacePhoto(PlaceModel place, File photo) async {
    try {
      String imageName =
          'IMG_${place.photos!.length.toString()}_${place.placeName}_${imgDate(place.joinDate!)}.jpg';
      Reference reference = _storage.ref().child(
          'places/${place.placeName! + imgDate(place.joinDate!)}/$imageName');
      UploadTask uploadTask = reference.putFile(photo);
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();

      _firestore.collection('places').doc(place.id).update({
        "photos": FieldValue.arrayUnion([imageUrl])
      });
      return true;
    } catch (e) {
      //displayError(e: e);
      Get.snackbar(
        "Error uploading photo",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  Future<bool> uploadPlaceLogo(PlaceModel place, File logo) async {
    try {
      String imageName = 'IMG_${place.placeName}_Logo.jpg';
      Reference reference = _storage.ref().child(
          'places/${place.placeName! + imgDate(place.joinDate!)}/$imageName');
      UploadTask uploadTask = reference.putFile(logo);
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();

      _firestore
          .collection('places')
          .doc(place.id)
          .update({"placeLogo": imageUrl});
      return true;
    } catch (e) {
      //displayError(e: e);
      Get.snackbar(
        "Error uploading photo",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  Future<bool> deletePlacePhoto(String placeId, String photoUrl) async {
    try {
      _storage
          .refFromURL(photoUrl)
          .delete()
          .then((value) => _firestore.collection('places').doc(placeId).update({
                "photos": FieldValue.arrayRemove([photoUrl])
              }));
      return true;
    } catch (e) {
      return false;
    }
  }
}
