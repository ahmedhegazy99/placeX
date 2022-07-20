import 'dart:developer';

import 'package:client/components/constants.dart';
import 'package:client/components/starRating.dart';
import 'package:client/controllers/accountController.dart';
import 'package:client/screens/editAccount/editAccount.dart';
import 'package:client/screens/editAccount/editPlace.dart';
import 'package:client/utils/utilFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class Account extends GetWidget<AccountController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double rating = getRating(controller.place!.reviews);
    return Scaffold(
      backgroundColor: backGrey,
      //backgroundColor: Color(0xfff8f9fc),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              Duration(seconds: 1),
              () {
                controller.update();
              },
            );
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Obx(
              () {
                if (controller.loading.value) {
                  return Container(
                      height: Get.height,
                      child: Center(child: CircularProgressIndicator()));
                }
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.03),

                      //avatar and name card
                      Card(
                        color: mainP,
                        //margin: EdgeInsets.all(12),
                        margin: EdgeInsets.fromLTRB(24, 12, 0, 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.zero, left: Radius.circular(60.0),
                            //Radius.circular(60.0),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              //circular owner photo
                              CachedNetworkImage(
                                imageUrl:
                                    '${controller.owner?.photoUrl ?? 'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'}',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: size.width * 0.25,
                                  height: size.width * 0.25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
                                  radius: size.width * 0.2,
                                ),
                              ),

                              //owner name
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  controller.owner?.ownerName ?? 'no data',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      //Place data card
                      if(controller.place != null)
                      Card(
                        //color: Colors.white,
                        margin: EdgeInsets.fromLTRB(0, 12, 16, 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.zero, right: Radius.circular(60.0),
                            //Radius.circular(60.0),
                          ),
                        ),

                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(12, 24, 12, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //logo, name, rate
                              Row(
                                children: [
                                  //place logo
                                  CachedNetworkImage(
                                    imageUrl:
                                        '${controller.place?.placeLogo ?? 'https://socialimpact.com/wp-content/uploads/2021/03/logo-placeholder.jpg'}',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: size.width * 0.3,
                                      height: size.width * 0.3,
                                      decoration: BoxDecoration(
                                        //shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        CircleAvatar(
                                      backgroundImage: Image.asset(
                                        'assets/images/logo_placeholder.jpg',
                                        fit: BoxFit.contain,
                                      ).image,
                                      radius: size.width * 0.2,
                                    ),
                                  ),

                                  //Spacer(flex: 1,),
                                  SizedBox(width: size.width * 0.02,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //place name
                                      Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          controller.place?.placeName ??
                                              'no data',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: mainP,
                                          ),
                                        ),
                                      ),

                                      //place rating
                                      //TODO: put rating here
                                      Container(
                                        margin: EdgeInsets.only(left: size.width * 0.03),
                                        child: Row(
                                          children: [
                                            Text("$rating"),
                                            StarRating(
                                              rating: rating,
                                              button: false,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: size.width * 0.01),
                                              child: Text("(${controller.place?.reviews?.length ?? 0})"),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),

                              Divider(),

                              //action icon buttons
                              Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //call icon button
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      log("call button clicked");
                                      launch(
                                          "tel://${controller.place?.contactNumber}?");
                                    },
                                    icon: Icon(
                                      Icons.call,
                                      semanticLabel: "Call",
                                    ),
                                    label: Text('call'),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                      shape: MaterialStateProperty.all(
                                          StadiumBorder()),
                                    ),
                                  ),

                                  //website icon button
                                  IconButton(
                                    onPressed: () {
                                      launch('${controller.place?.website}');
                                    },
                                    icon: Image.asset(
                                      "assets/images/website.png",
                                      color: mainP,
                                      semanticLabel: "Website",
                                    ),
                                  ),

                                  //facebook icon button
                                  IconButton(
                                    onPressed: () {
                                      launch('${controller.place?.facebook}');
                                    },
                                    icon: SvgPicture.asset(
                                      "assets/icons/facebook.svg",
                                      //width: size.width * 0.6,
                                    ),
                                  ),

                                  //email icon button
                                  IconButton(
                                    onPressed: () {
                                      launch(
                                          "mailto:${controller.place?.contactEmail}?");
                                    },
                                    icon: Icon(
                                      Icons.email,
                                      semanticLabel: "Email",
                                      color: mainP,
                                      size: 32,
                                    ),
                                  ),

                                  //location icon button
                                  IconButton(
                                    onPressed: () {
                                      launch(
                                          '${controller.place?.address?.locationUrl}');
                                    },
                                    icon: Icon(
                                      Icons.location_on,
                                      semanticLabel: "Location",
                                      color: mainP,
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),

                              Divider(),

                              ListTile(
                                title: Text(
                                  'Address',
                                ),
                                subtitle: Text.rich(
                                  TextSpan(
                                    text: '${controller.place?.address?.apartmentNo ?? ''}',
                                    children: [
                                      TextSpan(
                                        text: '${controller.place?.address?.building ?? ''}',
                                      ),
                                      TextSpan(
                                        text: '${controller.place?.address?.street ?? ''}',
                                      ),
                                      TextSpan(
                                        text: '${controller.place?.address?.district ?? ''}',
                                      ),
                                      TextSpan(
                                        text: '${controller.place?.address?.administrativeArea ?? ''}',
                                      ),
                                      TextSpan(
                                        text: '${controller.place?.address?.governorate ?? ''}',
                                      ),
                                    ],
                                  )
                                ),
                              ),

                              Divider(),

                              //about
                              ListTile(
                                title: Text(
                                  'About',
                                ),
                                subtitle: Text(
                                  '${controller.place?.description ?? 'no data'}',
                                ),
                              ),

                              Divider(),

                              //TODO: features

                              //TODO: rooms list
                              Container(
                                //height: size.height * 0.3,
                                child: Obx(() {

                                  if(controller.place!.rooms == null || controller.place!.rooms!.isEmpty)
                                    return Container(
                                      child: Flex(
                                        direction: Axis.vertical,
                                        children: [
                                          Text("There is no rooms, Edit place and add rooms"),
                                          TextButton(
                                            child: Text('here'),
                                            onPressed: (){
                                              Get.to(EditAccount());
                                            },
                                          ),
                                        ],
                                      ),
                                      //TODO: add here button to edit place page with label add rooms
                                    );

                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: Flex(
                                          direction: Axis.vertical,
                                          children: [
                                            Text("${controller.place?.rooms?[index].price ?? '40'}"),
                                            Text('EGP'),
                                          ]
                                        ),
                                        title: Text("${controller.place?.rooms?[index].title ?? 'Room1'}"),
                                        subtitle: Text("Capacity ${controller.place?.rooms?[index].capacity  ?? '25'}"),
                                        trailing: Icon(Icons.arrow_forward_ios),
                                      );
                                    },
                                  );
                                }),
                              ),

                              //TODO: photos
                            ],
                          ),
                        ),
                      ),

                      //TODO: reviews list
                    ],

                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
