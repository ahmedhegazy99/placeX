import 'package:client/models/ownerModel.dart';
import 'package:get/get.dart';


class UserController extends GetxController {
  //var _userModel = UserModel().obs;
  var userModel = OwnerModel().obs;

  OwnerModel get user => userModel.value;

  set user(OwnerModel value) => this.userModel.value = value;

  var loading = RxBool(true);

  void clear() {
    userModel.value = OwnerModel();
  }

  @override
  void onReady() {
    //print("user usercontroller: ${user.name}");

    // ever(userModel, (OwnerModel ? _) async {
    //     if (_ != null && loading.value) {
    //       user =
    //       await Get.find<DatabaseController>().getUser(_.id!);
    //      // print("user auth usertype: ${user.userType}");
    //       loading.value = false;
    //     }
    // });

    super.onReady();
  }

}
