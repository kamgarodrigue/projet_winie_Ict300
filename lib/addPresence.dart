import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ict300/api/localisation.dart';
import 'package:ict300/colors.dart';
import 'package:ict300/component/button.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddPresence extends StatefulWidget {
  AddPresence({Key? key}) : super(key: key);

  @override
  State<AddPresence> createState() => _AddPresenceState();
}

class _AddPresenceState extends State<AddPresence> {
  LocationData? position;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Localisation>().initLocation();

    //  decodeAddress(context.read<Localisation>().location!);
  }

  /* decodeAddress(LatLng locat) async {
    p = await placemarkFromCoordinates(52.2165157, 6.9437819);
    print(p.toString());
  }*/

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localisation = context.watch<Localisation>();
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      /* appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: Text("Ajouter une presence ",
              maxLines: 2,
              style: TextStyle(
                fontFamily: "Roboto-Bold",
                color: whiteColor,
                fontSize: 14,
              ))),*/
      body: Container(
          height: heigth,
          width: widht,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/maploc.jpeg"))),
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Card(
                elevation: 4,
                child: Container(
                  width: widht * .95,
                  height: 80,
                  padding: EdgeInsets.all(16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Longititue: "),
                            Text(localisation.location!.longitude.toString())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Latitude: "),
                            Text(localisation.location!.latitude.toString())
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: heigth * .1,
              ),
              Image.asset('assets/images/loader1.png'),
              SizedBox(
                height: heigth * .5,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: widht * .85,
                      height: 45,
                      child: Text("Marquer ma presence",
                          style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                              fontFamily: "Roboto-Medium")),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kPrimaryColors),
                    ),
                  ))
            ],
          )),
    );
  }
}
