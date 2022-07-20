import 'dart:developer';

import 'package:client/components/roundedButton.dart';
import 'package:client/components/xCard.dart';
import 'package:client/components/xInputField.dart';
import 'package:client/controllers/accountController.dart';
import 'package:client/models/roomModel.dart';
import 'package:client/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPlace extends GetWidget<AccountController> {
  EditPlace({Key? key}) : super(key: key);

  final _addressFormKey = GlobalKey<FormState>();
  final _roomsFormKey = GlobalKey<FormState>();

  final TextEditingController placeName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController website = TextEditingController();
  final TextEditingController facebook = TextEditingController();

  final TextEditingController addressApartmentNo = TextEditingController();
  final TextEditingController addressBuilding = TextEditingController();
  final TextEditingController addressStreet = TextEditingController();
  final TextEditingController addressDistrict = TextEditingController();
  final TextEditingController addressAdministrativeArea = TextEditingController();
  final TextEditingController addressGovernorate = TextEditingController();
  final TextEditingController addressLocationUrl = TextEditingController();

  final TextEditingController roomName = TextEditingController();
  final TextEditingController capacity = TextEditingController();
  final TextEditingController price = TextEditingController();
  
  //RxList rooms = RxList();
  List<RoomModel> rooms = List.empty(growable: true);
  List<String> features = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    placeName.text = controller.place!.placeName!;
    description.text = controller.place!.description ?? '';
    email.text = controller.place!.contactEmail ?? '';
    contactNumber.text = controller.place!.contactNumber ?? '';
    website.text = controller.place!.website ?? '';
    facebook.text = controller.place!.facebook ?? '';

    /*addressApartmentNo.text = controller.place!.address!.apartmentNo ?? '';
    addressBuilding.text = controller.place!.address!.building ?? '';
    addressStreet.text = controller.place!.address!.street ?? '';
    addressDistrict.text = controller.place!.address!.district ?? '';
    addressAdministrativeArea.text = controller.place!.address!.administrativeArea ?? '';
    addressGovernorate.text = controller.place!.address!.governorate ?? '';
    addressLocationUrl.text = controller.place!.address!.locationUrl ?? '';*/
    //rooms.add(controller.place!.rooms);
    rooms.addAll(controller.place!.rooms ?? [RoomModel()]);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            XInputField(
              validator: (val) =>
              val!.isEmpty ? 'Enter Space Name' : null,
              keyboardType: TextInputType.name,
              hintText: "Place Name",
              //icon: Icons.add_business,
              controller: placeName,
              enabled: false,
            ),
            XInputField(
              validator: (val) =>
              val!.isEmpty ? 'This field is empty' : null,
              keyboardType: TextInputType.name,
              hintText: "write about and describe your place",
              //icon: Icons.add_business,
              maxLines: 3,
              controller: description,
            ),
            XInputField(
              validator: (val) =>
              val!.isEmpty ? 'Enter Email' : null,
              keyboardType: TextInputType.name,
              hintText: "Email",
              //icon: Icons.email,
              controller: email,
            ),
            XInputField(
              validator: (val) =>
              val!.isEmpty ? 'Enter Phone Number' : null,
              keyboardType: TextInputType.name,
              hintText: "Phone Number",
              //icon: Icons.phone,
              controller: contactNumber,
            ),
            XInputField(
              validator: (val) =>
              val!.isEmpty ? 'Enter Website link' : null,
              keyboardType: TextInputType.name,
              hintText: "Website link",
              //icon: Icons.add_business,
              controller: website,
            ),
            XInputField(
              validator: (val) =>
              val!.isEmpty ? 'Enter Facebook link' : null,
              keyboardType: TextInputType.name,
              hintText: "Facebook link",
              //icon: Icons.add_business,
              controller: facebook,
            ),

            Divider(),

            //TODO: address area
            XCard(
              width: size.width,
              height: size.height * 0.65,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.width * 0.2),
              child: Form(
                key: _addressFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            validator:  (val) =>
                            val!.isEmpty ? 'Enter Apartment No.' : null,
                            decoration: InputDecoration(
                              labelText: 'Apartment No.',
                              labelStyle: TextStyle(fontSize: size.width * 0.03),
                            ),
                            controller: addressApartmentNo,
                          ),
                        ),
                        SizedBox(width: size.width * 0.03,),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            validator:  (val) =>
                            val!.isEmpty ? 'Enter Building' : null,
                            decoration: InputDecoration(
                              labelText: 'Building',
                              labelStyle: TextStyle(fontSize: size.width * 0.03),
                            ),
                            controller: addressBuilding,
                          ),
                        ),

                      ],
                    ),
                    TextFormField(
                      validator:  (val) =>
                      val!.isEmpty ? 'Enter Street' : null,
                      decoration: InputDecoration(
                        labelText: 'Street',
                        labelStyle: TextStyle(fontSize: size.width * 0.03),
                      ),
                      controller: addressStreet,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            validator:  (val) =>
                            val!.isEmpty ? 'Enter District' : null,
                            decoration: InputDecoration(
                              labelText: 'District',
                              labelStyle: TextStyle(fontSize: size.width * 0.03),
                            ),
                            controller: addressDistrict,
                          ),
                        ),
                        SizedBox(width: size.width * 0.03,),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            validator:  (val) =>
                            val!.isEmpty ? 'Enter administrative area' : null,
                            decoration: InputDecoration(
                              labelText: 'administrative area',
                              labelStyle: TextStyle(fontSize: size.width * 0.03),
                            ),
                            controller: addressAdministrativeArea,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      validator:  (val) =>
                      val!.isEmpty ? 'Enter Governorate' : null,
                      decoration: InputDecoration(
                        labelText: 'Governorate',
                        labelStyle: TextStyle(fontSize: size.width * 0.03),
                      ),
                      controller: addressGovernorate,
                    ),
                    TextFormField(
                      validator:  (val) =>
                      val!.isEmpty ? 'Enter Location Url' : null,
                      decoration: InputDecoration(
                        labelText: 'Location Url',
                        labelStyle: TextStyle(fontSize: size.width * 0.03),
                      ),
                      controller: addressLocationUrl,
                    ),
                  ],
                ),
              ),
            ),

            //TODO: rooms area
            if(controller.place?.rooms != null)
              if(controller.place!.rooms!.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Flex(
                          direction: Axis.vertical,
                          children: [
                            Text("${controller.place?.rooms?[index].price ?? '00'}"),
                            Text('EGP'),
                          ]
                      ),
                      title: Text("${controller.place?.rooms?[index].title ?? 'Room'}"),
                      subtitle: Text("Capacity ${controller.place?.rooms?[index].capacity  ?? 'cap'}"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Add Room"),
              onPressed: (){
                Get.bottomSheet(
                  BottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.0),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        //height: 200,
                        //color: mainP,
                        child: Center(
                          child: Form(
                            key: _roomsFormKey,
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: mainP,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30.0),
                                    ),
                                  ),
                                  height: 50,
                                  child: Text("Add Room", style: TextStyle(color: backW),),
                                ),
                                /*ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    //TODO: add photo list here and add photo button
                                  ],
                                ),*/
                                XInputField(
                                  validator:  (val) =>
                                  val!.isEmpty ? 'Enter Room Name' : null,
                                  labelText: "Room Name",
                                  controller: roomName,
                                ),
                                Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    XInputField(
                                      validator:  (val) =>
                                      val!.isEmpty ? 'Enter Capacity' : null,
                                      labelText: "Capacity",
                                      oWidth: 0.5,
                                      controller: capacity,
                                    ),
                                    XInputField(
                                      validator:  (val) =>
                                      val!.isEmpty ? 'Enter Price' : null,
                                      labelText: "Price",
                                      oWidth: 0.5,
                                      controller: price,
                                    )
                                  ],
                                ),

                                  Container(
                                    margin: EdgeInsets.all(size.width * 0.1),
                                    child: ElevatedButton(
                                      child: Text('add'.tr),
                                      /*style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all(ppmMain),
                                        backgroundColor: MaterialStateProperty.all(ppmBack),
                                      ),*/
                                      onPressed: () async {
                                        String f_roomName, f_capacity, f_price;
                                        log("add room button clicked");
                                        if (_roomsFormKey.currentState!.validate()) {
                                          if(roomName.text.isNotEmpty
                                              && capacity.text.isNotEmpty
                                              && price.text.isNotEmpty) {
                                            f_roomName = roomName.text;
                                            f_capacity = capacity.text;
                                            f_price = price.text;
                                            rooms.add(
                                              RoomModel(
                                                title: f_roomName,
                                                capacity: f_capacity,
                                                price: f_price,
                                              )
                                            );
                                            log("room added");
                                          }
                                      }else{
                                          log("room not added");
                                        }
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }, onClosing: () {  log("add room sheet closed");},
                  )
                );
              },
            ),

            //TODO: features area

            //TODO: photos area

            RoundedButton(
              text: 'Save',
              press: () async {
                print("save clicked");
                log("save button clicked");
                controller.updatePlace(description.text, email.text, contactNumber.text, facebook.text, website.text, rooms, features);
              },
            ),

          ],
        ),
      ),
    );
  }
}
