import 'package:client/components/constants.dart';
import 'package:client/screens/editAccount/editPlace.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatelessWidget {
  //const EditAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
              "PlaceX",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "englishBebas",
                  //color: mainP,
                  fontSize: 24),
            ),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: 'Owner'),
            Tab(text: 'Place'),
          ]),
        ),
        body: TabBarView(
            children: [
          Container(),
          EditPlace(),
        ]),
      ),
    );
  }
}
