import 'package:client/models/placeModel.dart';
import 'package:get/get.dart';

import 'databaseController.dart';

class PlacesController extends GetxController{

  var _placesStream = RxList<PlaceModel>();

  List<PlaceModel>? get places => _placesStream;

  var loading = RxBool(true);

  @override
  void onInit() {
    _placesStream.bindStream(Get.find<DatabaseController>().getPlaces());
    loading.toggle();
    super.onInit();
  }

}