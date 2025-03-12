import 'package:shared_preferences/shared_preferences.dart';
import '../../models/profile_model.dart';


class WhoIAm {

  static void saveUser({required ProfileModel profileModel}) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      sharedPreferences.setString('pk', profileModel.pk.toString());
      sharedPreferences.setString('email', profileModel.email);
      sharedPreferences.setString('username', profileModel.username);
      sharedPreferences.setString('firstName', profileModel.firstName ?? '');
      sharedPreferences.setString('lastName', profileModel.lastName ?? '');
    } catch (error) {
      // LogUtil.e(error.toString());
    }
  }

  static Future<ProfileModel?> getUser() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      return ProfileModel(
        pk: int.parse(preferences.getString('pk').toString()),
        username: preferences.getString('username').toString(),
        email: preferences.getString('email').toString(),
        firstName: preferences.getString('firstName').toString(),
        lastName: preferences.getString('lastName').toString(),
      );
    } catch (error) {
      return null;
    }
  }

  static Future<void> removeUser() async {

    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

      sharedPreferences.remove('pk');
      sharedPreferences.remove('email');
      sharedPreferences.remove('username');
      sharedPreferences.remove('firstName');
      sharedPreferences.remove('lastName');

    } catch (error) {
      // LogUtil.e(error.toString());
    }

  }

}