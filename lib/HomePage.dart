import 'package:flutter/material.dart';
import 'package:ict300/Modal/jour.dart';
import 'package:ict300/api/AuthService.dart';
import 'package:ict300/colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Jour> jours = [
    Jour(id: 1, intitule: "Lun", ischecked: true),
    Jour(id: 2, intitule: "Mar", ischecked: false),
    Jour(id: 3, intitule: "Mer", ischecked: false),
    Jour(id: 4, intitule: "Jeu", ischecked: false),
    Jour(id: 5, intitule: "Ven", ischecked: false),
    Jour(id: 6, intitule: "Sam", ischecked: false),
    Jour(id: 7, intitule: "Dim", ischecked: false),
  ];
  @override
  void initState() {
    super.initState();

    context.read<AuthService>().getjour();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: false,
          title: Text("Mon planing de la semaine",
              maxLines: 2,
              style: TextStyle(
                fontFamily: "Roboto-Bold",
                color: kBlack,
                fontSize: 14,
              ))),
      body: Container(
        height: heigth,
        width: widht,
        child: Column(
          children: [
            Container(
              height: 50,
              color: kPrimaryColors,
              child: Row(
                  children: List.generate(
                      auth.jours.length,
                      (index) => Expanded(
                              child: GestureDetector(
                            onTap: () {
                              setState(() {
                                auth.jours[index].ischecked = true;
                                auth.jours.forEach((element) {
                                  if (auth.jours[index].id != element.id) {
                                    element.ischecked = false;
                                  }
                                });
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 60,
                              child: Text(
                                auth.jours[index].intitule!,
                                style: TextStyle(
                                    fontFamily: "Roboto-Medium",
                                    fontSize: 17,
                                    color: whiteColor),
                              ),
                              color: auth.jours[index].ischecked!
                                  ? const Color.fromRGBO(217, 217, 217, 0.5)
                                  : Colors.transparent,
                            ),
                          )))),
            ),
            Expanded(flex: 5, child: Container())
          ],
        ),
      ),
    );
  }
}
