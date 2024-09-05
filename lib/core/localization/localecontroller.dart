import 'dart:ui';

import 'package:get/get.dart';
import 'package:online_flower_shop_auth/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  AppServices appServices = Get.put(AppServices());

  changeLang(String deflan) {
    Locale locale = Locale(deflan);
    appServices.sharedPreference.setString("language", deflan);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = appServices.sharedPreference.getString("language");
    if (sharedPrefLang == "ar") {
      language = const Locale('ar');
    } else if (sharedPrefLang == "en") {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
