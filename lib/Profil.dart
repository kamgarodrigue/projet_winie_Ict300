import 'package:flutter/material.dart';
import 'package:ict300/colors.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: heigth,
        width: widht,
        child: ListView(
          children: [
            Card(
              elevation: 2,
              child: Container(
                height: 214,
                width: 313,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/Frame 1.png"),
                    ),
                    Text("Kamga rodrigue",
                        style: TextStyle(
                            fontSize: 18,
                            color: kBlack,
                            fontFamily: "Roboto-Bold")),
                    Text("Rodrigue.kamga54@facscience.com",
                        style: TextStyle(
                            fontSize: 15,
                            color: kBlack,
                            fontFamily: "Roboto-Regular")),
                  ],
                ),
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.person_outline,
                  size: 25,
                  color: kPrimaryColors,
                ),
                title: Text("Mon Compte",
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: "Poppins-medium",
                      color: kBlack,
                      fontSize: 14,
                    )),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                )),
            Divider(
              color: kBlack,
            ),
            ListTile(
                leading: Icon(
                  Icons.settings_outlined,
                  size: 25,
                  color: kPrimaryColors,
                ),
                title: Text("Paramètres",
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: "Poppins-medium",
                      color: kBlack,
                      fontSize: 14,
                    )),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                )),
            Divider(
              color: kBlack,
            ),
            ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 25,
                  color: kPrimaryColors,
                ),
                title: Text("Déconnexion",
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: "Poppins-medium",
                      color: kBlack,
                      fontSize: 14,
                    )),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                )),
            Divider(
              color: kBlack,
            ),
            ListTile(
                leading: Icon(
                  Icons.info,
                  size: 25,
                  color: kPrimaryColors,
                ),
                title: Text("A propos de nous",
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: "Poppins-medium",
                      color: kBlack,
                      fontSize: 14,
                    )),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                )),
            Divider(
              color: kBlack,
            )
          ],
        ),
      ),
    );
  }
}
