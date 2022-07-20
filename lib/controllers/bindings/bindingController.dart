import 'package:get/get.dart';
import '../authController.dart';
import '../databaseController.dart';
import '../mainBarController.dart';
import '../accountController.dart';
import '../placesController.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(DatabaseController());
    Get.put(AccountController());
    Get.put(PlacesController());
    Get.put(MainBarController());
  }
}
