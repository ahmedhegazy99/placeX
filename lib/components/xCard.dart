import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

import 'constants.dart';

class XCard extends StatelessWidget {
  final Widget child;
  double? width, height;
  EdgeInsetsGeometry? padding, margin;

  XCard({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: width ?? size.width,
            height: height ?? size.height * 0.6,
            decoration: BoxDecoration(
              color: backP,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(300),
                topRight: Radius.zero,
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(300),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2,2),
                  blurRadius: 5,
                )
              ],
            ),
          ),
          Container(
            //width: _containerKey.currentContext!.size!.width,
            //height: _containerKey.currentContext!.size!.height,
            width: width ?? size.width,
            height: height ?? size.height * 0.6,
            decoration: BoxDecoration(
              color: backGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.circular(150),
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.zero,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2,2),
                  blurRadius: 5,
                )
              ],
            ),
          ),
          Container(
            padding: padding,
            margin: margin,
            child: child,
          ),
        ],
      ),
    );
  }
}
