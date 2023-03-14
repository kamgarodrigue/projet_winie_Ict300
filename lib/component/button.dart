import 'package:flutter/material.dart';
import 'package:ict300/colors.dart';

class Button extends StatefulWidget {
  final String? text;
  void Function()? onTap;
  Button({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: 179,
        height: 45,
        child: Text(widget.text!,
            style: TextStyle(
                fontSize: 18, color: whiteColor, fontFamily: "Roboto-Medium")),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kPrimaryColors),
      ),
    );
  }
}
