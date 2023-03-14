import 'package:flutter/material.dart';

const kPrimaryColors = Color.fromRGBO(15, 173, 207, 1);
const kSecondaryColor = Color.fromRGBO(238, 229, 231, 1);
const kRed = Color.fromRGBO(245, 90, 90, 1);
const graycolor = Color.fromRGBO(217, 217, 217, 1);
const kLinckColor = Color.fromRGBO(28, 119, 143, 1);
const whiteColor = Color.fromRGBO(255, 255, 255, 1);
const kBlack = Colors.black;

Text title(String text) {
  return Text(
    text,
    style:
        TextStyle(color: whiteColor, fontSize: 25, fontFamily: 'Roboto-Black'),
    textAlign: TextAlign.center,
  );
}

Text subTitle(String text) {
  return Text(
    text,
    style:
        TextStyle(color: whiteColor, fontSize: 16, fontFamily: 'Roboto-Light'),
    textAlign: TextAlign.center,
  );
}
