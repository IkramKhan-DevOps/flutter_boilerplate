class APIUrl{

  // REQUIRED
  static String protocol = 'https';
  static String domain = '127.0.0.1:8000';
  static String root = '$protocol://$domain/';
  static String api = '${root}api/';
  static String v1 = '${api}v1/';
  static String accountsAppBase = '${root}auth/';

  static String signIn = '${accountsAppBase}login/';
  static String signUp = '${accountsAppBase}registration/';
  static String passwordChange = '${accountsAppBase}password/change/';
  static String profile = '${accountsAppBase}profile/';
  static String accountDeactivate = '${accountsAppBase}deactivate/';
  static String accountDelete = '${accountsAppBase}delete/';
  static String subscriptionSync(String id) => '${v1}subscription/$id/sync/';
  static String logout = '${accountsAppBase}auth/logout/';

  static String home = '${v1}home/';
  static String favorite = '${v1}favorite/';
  static String favoriteAdd = favorite;
  static String favouriteDelete(String id) => '${v1}favorite/$id/delete/';
  static String productDetail(String id) => '${v1}product/$id/';

  static String notifications = '${api}v1/notification/';
  static String notificationsMarkRead = '${api}v1/notification/mark-all-as-read/';

  /// [LIST, CREATE, DETAIL, RECOMMENDATIONS]
  static String handScan = '${v1}hand-scan/';
  static String handScanRecommendations(String id) => '${v1}hand-scan/$id/recommendations/';
  static String handScanDetail(String id) => '${v1}hand-scan/$id/';

  /// UNUSED - BUT REQUIRED FOR FUTURE
  static String fcm = '${root}fcm/';

  static String signInGoogle = '${accountsAppBase}google/';
  static String signInApple = '${accountsAppBase}apple/';

  static String deviceRegister = '${fcm}api/device/register';
  static String deviceRegisterOrUpdate = '${fcm}api/device/register-or-change/';

  static String newsLetterSubscribe = '${v1}newsletter/subscribe/';
  static String productsHome(String query) => '${v1}product-home/?manufacturer=$query';
  static String productsHomeV2(String query) => '${v1}product-home-v2/?manufacturer=$query';

}

class APIWebUrl {

  static const String protocol = 'https';
  static const String domain = '127.0.0.1:8000';
  static const String base = '${protocol}://${domain}/';

  static const String termsAndConditions = '${base}terms-and-conditions/';
  static const String privacyPolicy = '${base}privacy-policy/';
  static const String contactUs = '${base}contact-us/';
  static const String resetPassword = '${base}accounts/password/reset/';

}