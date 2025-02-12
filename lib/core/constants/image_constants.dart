
import 'package:flutter_boilerplate/core/configs/app_images.dart';

class ImageConstants {

  // Base path
  static const String base = 'assets/';
  static const String images = '${base}images/';
  static const String logos = '${images}logos/';

  // Images (LOGOS)
  static const String logoLight =AppImages.logoLight;
  static const String logoDark =AppImages.logoDark;
  static const String logoLightDarkBG =AppImages.logoLightDarkBG;
  static const String logoDarkLightBG =AppImages.logoDarkLightBG;
  static const String logo = logoLight;

  // Images (OTHER)
  static const String noImage = '${images}no_image.png';
  static const String loading = '${images}loading.gif';

}

class LottieConstant {

  static String cancel = 'assets/json/cancel.json';
  static String completed = 'assets/json/completed.json';
  static String notFound = 'assets/json/loading.json';
  static String pending = 'assets/json/pending.json';
  static String notFoundSearch = 'assets/json/loading-lottie.json';
  static String construction = 'assets/json/construction.json';
  static String pageNotFound = 'assets/json/page_not_found.json';
  static String world = 'assets/json/world.json';
  static String loading = 'assets/json/loading.json';
  static String ai = 'assets/json/ai.json';

  static String getIcon(String status){
    switch(status){
      case 'not_found':
        return loading;
      case 'cancel':
      case 'cancelled':
      case 'closed':
      case 'no':
        return cancel;
      case 'yes':
      case 'completed':
      case 'complete':
      case 'accepted':
      case 'accept':
        return completed;
      case 'not_found_search':
        return notFoundSearch;
      case 'pending':
        return pending;
      default:
        return loading;
    }
  }

}