import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ict300/HomeScreen.dart';
import 'package:ict300/api/AuthService.dart';
import 'package:ict300/colors.dart';
import 'package:ict300/component/Loader.dart';
import 'package:ict300/component/button.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController telcontroller = TextEditingController();
  TextEditingController paswordcontroller = TextEditingController();
  bool iscisible = true, _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
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
                  hintStyle:
                      TextStyle(fontSize: 17, fontFamily: "Roboto-Regular"),
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
                  hintStyle:
                      TextStyle(fontSize: 17, fontFamily: "Roboto-Regular"),
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
                  print(telcontroller.text + " " + paswordcontroller.text);
                  setState(() {
                    _isLoading = true;
                  });
                  context
                      .read<AuthService>()
                      .login(telcontroller.text, paswordcontroller.text)
                      .then((value) {
                    setState(() {
                      _isLoading = false;
                    });
                    showTopSnackBar(
                      context,
                      CustomSnackBar.success(
                        message: "connecté",
                      ),
                    );
                    Navigator.of(context).pop();
                  }).catchError((err) {
                    setState(() {
                      _isLoading = false;
                    });
                  });
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
        ),
        Container(
            child: _isLoading
                ? Loader(loadingTxt: 'Creation de compte encour ...')
                : Container())
      ],
    ));
  }
}
