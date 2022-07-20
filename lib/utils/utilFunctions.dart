// Help to store datetime in firestore
import 'package:client/models/reviewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

DateTime dateTimeFromTimestamp(Timestamp? timestamp) => timestamp!.toDate();
//DateTime.parse(timestamp.toDate().toString());
Timestamp dateTimeToTimestamp(DateTime? dateTime) =>
    Timestamp.fromDate(dateTime!);

void displayError({dynamic e, dynamic ee}) {
  if (e != null) {
    Get.snackbar(
      e,
      ee ?? 'error'.tr,
      //snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    );
  } else {
    Get.dialog(
      Text("Something went wrong try again later."),
    );
  }
}

String imgDate(DateTime dateTime) {
  DateFormat formatter = DateFormat('yyyyMMdd');
  String formatted = formatter.format(dateTime);
  return formatted;
}

double getRating(List<ReviewModel>? reviews) {
  double rate = 0;
  int sumRate = 0;
  if(reviews != null) {
    reviews.map((e) {
      sumRate = sumRate + e.rating!;
    });
    rate = sumRate / reviews.length;
  }
  return rate;
}
