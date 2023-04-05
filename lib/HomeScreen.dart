import 'package:flutter/material.dart';
import 'package:ict300/HomePage.dart';
import 'package:ict300/Profil.dart';
import 'package:ict300/addPresence.dart';
import 'package:ict300/api/AuthService.dart';
import 'package:ict300/api/localisation.dart';
import 'package:ict300/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Localisation>().initLocation();
    context.read<AuthService>().getjour();
  }

  Widget _affichePage = HomePage();
  int _current = 0;
  bool one = true, two = false;
  void _change(int index) {
    setState(() {
      _current = index;
      _affichePage = _pageSelectionEe(_current);
    });
  }

  Widget _pageSelectionEe(int index) {
    switch (index) {
      case 0:
        one = true;
        two = false;
        return HomePage(); // CheckOut();
        break;
      case 1:
        one = false;
        two = false;

        return AddPresence();
        break;

      case 2:
        one = false;
        two = true;
        return Profil();
        break;
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        backgroundColor: kSecondaryColor,
        icon: Image.asset(
          'assets/tab3.png',
        ),
        activeIcon: Image.asset(
          'assets/tab6.png',
          color: kPrimaryColors,
        ),
        /*
          l: Text(
            "",
            style: TextStyle(
                color: kSecondaryColor,
                fontSize: 10,
                fontFamily: 'Avenir Medium'),
          )*/
      ),
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/tab5.png',
          color: kPrimaryColors,
        ),
        icon: Image.asset('assets/tab2.pngs'),
        /*title: Text(
            "",
            style: TextStyle(
                color: kSecondaryColor,
                fontSize: 10,
                fontFamily: 'Avenir Medium'),
          )*/
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.add,
          color: kPrimaryColors,
        ),
        icon: Icon(
          Icons.add,
          color: kSecondaryColor,
        ),
        /* icon: Text(
            "",
            style: TextStyle(
                color: kSecondaryColor,
                fontSize: 10,
                fontFamily: 'Avenir Medium'),
          )*/
      ),
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/tab1.png',
          color: kPrimaryColors,
        ),
        icon: Image.asset(
          'assets/tab4.png',
        ),
        /*title: Text(
            "",
            style: TextStyle(
                color: kSecondaryColor,
                fontSize: 10,
                fontFamily: 'Avenir Medium'),
          )*/
      ),
      BottomNavigationBarItem(
        activeIcon: Image.asset(
          'assets/tab7.png',
          color: kPrimaryColors,
        ),
        icon: Image.asset('assets/tab.png'),
        /*title: Text(
            "",
            style: TextStyle(
                color: kSecondaryColor,
                fontSize: 10,
                fontFamily: 'Avenir Medium'),
          )*/
      ),
    ];
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          _affichePage,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: graycolor,
                width: widht,
                height: heigth * 0.08,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: widht * 0.1, right: widht * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => _change(0),
                          icon: Icon(
                            Icons.home,
                            size: 40,
                            color: this.one ? kPrimaryColors : whiteColor,
                          )),
                      GestureDetector(
                        onTap: () => _change(2),
                        child: Image.asset(
                          "assets/images/profile.png",
                          width: 32,
                          color: this.two ? kPrimaryColors : whiteColor,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            top: heigth * 0.875,
            child: Container(
                width: widht,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    _change(1);
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: whiteColor,
                    child: Image.asset(
                      "assets/images/download (1).png",
                      fit: BoxFit.cover,
                      width: 20,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
