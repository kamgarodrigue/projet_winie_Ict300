import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ict300/HomeScreen.dart';
import 'package:ict300/colors.dart';
import 'package:ict300/component/button.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController telcontroller = TextEditingController();
  TextEditingController paswordcontroller = TextEditingController();
  bool iscisible = true;
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      width: widht,
      height: heigth,
      padding: EdgeInsets.only(top: 30, right: 16, left: 16),
      child: Column(
        //padding: EdgeInsets.only(top: 8),
        children: [
          Image.asset("assets/images/download (1).png"),
          SizedBox(
            height: 16,
          ),
          Text(
            "Connexion",
            style: TextStyle(
                color: kBlack, fontSize: 25, fontFamily: 'Roboto-Black'),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: telcontroller,
            style: TextStyle(fontSize: 17, fontFamily: "Roboto-Medium"),
            decoration: InputDecoration(
              hintText: "Telphone",
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 17, fontFamily: "Roboto-Regular"),
            ),
          ),
          Divider(
            color: kBlack,
          ),
          TextField(
            controller: paswordcontroller,
            style: TextStyle(fontSize: 17, fontFamily: "Roboto-Medium"),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    iscisible = !iscisible;
                  });
                },
                icon: iscisible
                    ? Icon(
                        Icons.visibility,
                        color: graycolor,
                        size: 20,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: graycolor,
                        size: 20,
                      ),
              ),
              hintText: "Mot de passe",
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 17, fontFamily: "Roboto-Regular"),
            ),
          ),
          Divider(
            color: kBlack,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Mot de passe oublié?",
            style: TextStyle(
                color: kPrimaryColors,
                fontSize: 14,
                fontFamily: "Roboto-Regular"),
          ),
          SizedBox(
            height: 20,
          ),
          Button(
            text: "Conexion",
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                          // context: widget.context,
                          )));
            },
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "ou",
            style: TextStyle(
                color: kPrimaryColors,
                fontSize: 14,
                fontFamily: "Roboto-Regular"),
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset("assets/images/image 1 (1).png")
        ],
      ),
    ));
  }
}
