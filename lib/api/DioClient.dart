import 'package:dio/dio.dart';

var baseurl = "http://192.168.0.100:8080";
Dio dio() {
  Dio dio = new Dio();

  //"http://192.168.43.45:5000/api/";
  dio.options.baseUrl = "http:///192.168.0.100:8080/";
  dio.options.headers['content-Type'] = 'application/json';
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 3000;
  return dio;
}

Dio dio1() {
  Dio dio = new Dio();
  //  // http://192.168.43.45:5000/api
  dio.options.baseUrl = "https://graphhopper.com/api/1/";
  dio.options.headers['content-Type'] = 'application/json';
  return dio;
}
