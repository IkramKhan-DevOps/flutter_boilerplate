import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/profile_model.dart';
import '../configs/app_routes.dart';
import '../errors/app_errors.dart';
import '../network/api_network.dart';
import '../network/api_network_base.dart';
import '../network/api_urls.dart';
import '../utils/logger.dart';
import '../utils/who_am_i.dart';

class AuthToken {

  static bool isUserLoggedIn = false;

  static Future saveToken(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('key', key);
  }

  static Future<String?> getToken() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String? key = sharedPreferences.getString('key');
      return key;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> removeToken() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.remove('key');
      return true;
    } catch (e) {
      return false;
    }
  }

  static checkLoginStatus(BuildContext context) {


    // CHECK IF TOKEN EXISTS OR NOT
    AuthToken.getToken().then((value) async {

      // IF NO TOKEN IS NONE LEAVE
      if (value == null || value == '') {
        Navigator.pushReplacementNamed(context, AppRoutes.authScreen);

      // NO TOKEN FOUND
      } else {

        // VALIDATE (VALID)
        bool isTokenValid = await afterLogin(context);
        if (!isTokenValid) {

          AppPrint.print('\n\n!!!!! ERROR > AFTER LOGIN > CHECK LOGIN > CODE: token expired\n\n\n');
          await AuthToken.logoutUser(context);

        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        }

      }
    }).onError((error, stackTrace) {
      AppPrint.print('\n\n!!!!! ERROR > AFTER LOGIN > CHECK LOGIN > FUNC: \n$error\n\n');
      Navigator.pop(context);
    });
  }

  static Future<bool> afterLogin(BuildContext context, [bool removeCacheAndRecall = false]) async {
    AuthToken.isUserLoggedIn = true;
    BaseApiService apiService = NetworkApiService();
    ProfileModel profileModel;

    try {
      var response = await apiService.getAPI(APIUrl.profile, true);
      profileModel = ProfileModel.fromJson(response);
      WhoIAm.saveUser(profileModel: profileModel);
    } catch (error) {
      AppPrint.print('\n\n!!!!! ERROR > AFTER LOGIN > PROFILE GET > API: \n$error\n\n');
      return false;
    }

    return true;
  }

  static Future<void> logoutUser(BuildContext context) async {

    /// CODE IS RELATED TO SUBSCRIPTION MANAGER
    // await SubscriptionManager().logOutUser();
    /// ----------------------------------------


    bool tokenRemoved = await AuthToken.removeToken();
    if (tokenRemoved) {
      await WhoIAm.removeUser();
      AuthToken.isUserLoggedIn = false;

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, AppRoutes.authScreen);
    } else {
      // Handle the error case where token could not be removed
      FlushMessage.flushBar(context, 'Error logging out. Please try again.', 'danger');
    }
  }

}
