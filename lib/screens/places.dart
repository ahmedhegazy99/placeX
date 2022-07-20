import 'package:client/components/constants.dart';
import 'package:client/components/placeCard.dart';
import 'package:get/get.dart';
import 'package:client/controllers/placesController.dart';
import 'package:flutter/material.dart';

class Places extends GetWidget<PlacesController> {
  const Places({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGrey,
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
            () {
              controller.update();
            },
          );
        },
        child: Container(
          child: Obx((){
            if(controller.loading.value){
              return Center(child: CircularProgressIndicator());
            }

            if (controller.places == null || controller.places?.isEmpty == true)
              return Column(
                children: [
                  //CreatePlace(),
                  Center(
                    child: Text('noPosts'.tr),
                  ),
                ],
              );

            return Obx(() {
              return ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: controller.places!.length,
                itemBuilder: (context, index) {
                  return PlaceCard(place: controller.places![index]);
                },
                //),
              );
            });
          }),
        ),
      ),
    );
  }
}
