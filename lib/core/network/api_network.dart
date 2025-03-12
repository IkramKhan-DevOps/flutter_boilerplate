import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../errors/app_exceptions.dart';
import '../storage/auth_storage.dart';
import 'api_network_base.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getAPI(String url, [bool isToken = false]) async {
    try {
      var res;
      if (isToken) {
        res = await http.get(
          Uri.parse(url),
          headers: {'Authorization': 'Token ${await AuthToken.getToken()}'},
        ).timeout(
          const Duration(seconds: 10),
        );
      } else {
        res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      }
      return validateAPIResponse(res);
    } on SocketException {
      throw FetchDataException('No internet connection available.');
    }
  }

  @override
  Future postAPI(String url, dynamic data,
      [bool isToken = false, noJson = false]) async {
    try {
      var res;

      if (isToken) {
        res = await http.post(
          Uri.parse(url),
          body: data,
          headers: {
            'Authorization': 'Token ${await AuthToken.getToken()}',
            'Content-Type': noJson
                ? 'application/x-www-form-urlencoded'
                : 'application/json',
          },
        ).timeout(
          const Duration(seconds: 15),
        );
      } else {
        res = await http
            .post(Uri.parse(url), body: data)
            .timeout(const Duration(seconds: 15));
      }

      return validateAPIResponse(res);
    } on SocketException {
      throw FetchDataException('No internet connection available.');
    }
  }

  @override
  Future putAPI(String url, dynamic data) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? key = prefs.getString('key');

      var res = await http.put(
        Uri.parse(url),
        body: data,
        headers: {'Authorization': 'Token $key'},
      ).timeout(
        const Duration(seconds: 15),
      );

      return validateAPIResponse(res);
    } on SocketException {
      throw FetchDataException('No internet connection available.');
    }
  }

  @override
  Future deleteAPI(String url, [bool isToken = false, noJson = false]) async {
    try {
      var res = await http.delete(
        Uri.parse(url),
        headers: {'Authorization': 'Token ${await AuthToken.getToken()}'},
      ).timeout(
        const Duration(seconds: 15),
      );
      return validateAPIResponse(res);
    } on SocketException {
      throw FetchDataException('No internet connection available.');
    }
  }

  dynamic validateAPIResponse(http.Response response) {
    /// 201: created - 200: okay
    /// 404: not found - 400: bad request

    switch (response.statusCode) {
      case 201:
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorizedException(response.body.toString());

      default:
        throw response.body.toString();
    }
  }

  String captureResponseErrors(var response) {
    return response.toString();
  }
}
