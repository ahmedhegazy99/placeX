import 'dart:developer';

import 'package:client/controllers/authController.dart';
import 'package:client/models/ownerModel.dart';
import 'package:client/models/placeModel.dart';
import 'package:client/models/roomModel.dart';
import 'package:client/utils/utilFunctions.dart';
import 'package:get/get.dart';

import 'databaseController.dart';

class AccountController extends GetxController {
  String? ownerId;
  AccountController({this.ownerId});

  var _owner = Rxn<OwnerModel>();
  OwnerModel? get owner => _owner.value;

  var _place = Rxn<PlaceModel>();
  PlaceModel? get place => _place.value;

  var loading = RxBool(true);

  void clear() {
    _owner.value = OwnerModel();
    _place.value = PlaceModel();
  }

  @override
  void onInit() async {
    print("start onInit account controller");
    //await getOwner();
    // await getPlace();
    // loading.value = false;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    print("Start on ready account controller");
    ownerId = await Get.find<AuthController>().owner?.uid;
    await getPlace();
    loading.value = false;
    super.onReady();
  }

  Future<void> _getOwner() async {
    try {
      //loading.toggle();
      print("start getting owner");
      print("owner id : $ownerId");
      _owner.value = await Get.find<DatabaseController>().getOwner(ownerId!);
      print(owner!.placeId);
      //loading.toggle();
    } catch (e) {
      print(e);
      displayError();
    }
  }

  Future<void> getPlace() async {
    try {
      loading.toggle();
      print("start getting place");
      await _getOwner();
      _place.value = await Get.find<DatabaseController>().getPlace(owner!.placeId!);
      loading.toggle();
    } catch (e) {
      print(e);
      displayError();
    }
  }

  void updatePlace(
      /*String? placeName,*/ String? description, String? contactEmail,
      String? contactNumber, String? facebook, String? website,
      List<RoomModel>? rooms, List<String>? features) async {
    try {
      loading.toggle();

      PlaceModel _place = PlaceModel(
        //placeName: placeName!.trim(),
        description: description!.trim(),
        contactEmail: contactEmail,
        contactNumber: contactNumber,
        facebook: facebook,
        website: website,
        rooms: rooms,
        features: features,
      );

      print("update from account controller");
      log("update from account controller");
      await Get.find<DatabaseController>().updatePlace(_place).catchError((error) {
        log("Failed to update place: $error");
        displayError();
      });

      loading.toggle();
    } catch (e) {
      displayError(e: e);
      loading.toggle();
    }
  }

}
