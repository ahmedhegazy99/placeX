import 'package:flutter/material.dart';
import 'dart:math' show pi;

const secondY = Color(0xfff1c40f);
const secondDarkY = Color(0xfff7a50c);
const secondLight = Color(0xffffce44);

const goldStar = Color(0xfffdcc0d);

const mainP = Colors.purple;
const mainLigthP = Colors.purpleAccent;

const backW = Colors.white;
const backGrey = Color(0xfff5f5f5);
const backP = Color(0xffeddbf4);
//const backP = Color(0x1a9C27B0);

const black = Colors.black;

const mindersLightBlack = Color(0xff232323);

const gradientLightY = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [const Color(0xffffb347), const Color(0xffffcc33)],
  transform: GradientRotation(pi / 135)
);

const gradientMediumY = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [const Color(0xfff3c600), const Color(0xfff7a50c)],
    transform: GradientRotation(pi / 45)
);

const gradientDarkB = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [const Color(0xff141e30), const Color(0xff000000)],
    transform: GradientRotation(pi / 45)
);


const customTextStyle = TextStyle(
  color: Colors.black , fontStyle: FontStyle.normal , fontSize: 12.0, fontFamily: "englishTex",
);