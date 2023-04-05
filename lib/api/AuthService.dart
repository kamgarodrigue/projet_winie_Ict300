import 'dart:io';

import 'package:dio/dio.dart' as Dio;

import 'package:flutter/cupertino.dart';
import 'package:ict300/Modal/jour.dart';
import 'package:ict300/Modal/personnel.dart';
import 'package:ict300/Modal/planing.dart';

import 'package:ict300/api/DioClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService extends ChangeNotifier {
  Future<SharedPreferences> sharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref;
  }

  Personnel? _localClient;
  Personnel? get user => _localClient;
  bool _isLoggedIn = false;
  List<Jour> _jours = [];
  List<Jour> get jours => _jours;

  List<Planing> _planing = [];
  List<Planing> get planing => _planing;
  bool get authenticate {
    sharedPreferences().then((value) {
      _isLoggedIn = value.getString("user") == null ? false : true;
      if (_isLoggedIn) {
        //logout();
        //print(json.decode(value.getString("user").toString()));
        // print(_isLoggedIn);
        _localClient =
            Personnel.fromJson(json.decode(value.getString("user")!));
      }
      // print(json.decode(value.getString("user")!));
      notifyListeners();
    });
    return this._isLoggedIn;
  }

  Future login(String email, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Dio.Response response = await dio().get(
      "logint/$email/$password",
    );
    //print(response);
    print(response);
    pref.setString("user", response.toString());
    return response;
  }

  Future<void> getuser(String? id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("http://192.168.132.171:8080/clients/id/$id");
    Dio.Response response = await dio().get(
      "clients/id/$id",
    );

    //print(response);
    print(response);
    pref.setString("user", response.toString());
  }

  Future getUserById(String id) async {
    Map data = {
      "userID": id,
    };

    Dio.Response response = await dio().post("users/show", data: data);

    return response.data;
  }

  Future register(Personnel personnel) async {
    Dio.Response response =
        await dio().post("clients", data: personnel.toJson());
    print(response);
    return response;
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("user");
    notifyListeners();
  }

  Future getjour() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Dio.Response response = await dio().get(
      "jours",
    );
    //print(response);
    print(response);
    pref.setString("jour", response.toString());
    _jours = decodejour(response.data);
    notifyListeners();
    return response;
  }

  List<Jour> decodejour(responseBody) {
    final parsed = responseBody;
    // print(parsed);
    return parsed.map<Jour>((json) => Jour.fromJson(json)).toList();
  }

  Future getPlanning(idjour) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Dio.Response response = await dio().get(
      "programmebyPersonnelAndJour/${user!.id}/$idjour",
    );
    //print(response);
    print(response);

    _planing = decodePlaning(response.data);
    notifyListeners();
    return response;
  }

  List<Planing> decodePlaning(responseBody) {
    final parsed = responseBody;
    // print(parsed);
    return parsed.map<Planing>((json) => Planing.fromJson(json)).toList();
  }
}
