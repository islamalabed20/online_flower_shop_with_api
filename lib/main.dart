import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_flower_shop_auth/core/localization/localecontroller.dart';
import 'package:online_flower_shop_auth/core/localization/translation.dart';
import 'package:online_flower_shop_auth/core/services/dio_services.dart';
import 'package:online_flower_shop_auth/core/services/services.dart';
import 'package:online_flower_shop_auth/core/utility/settings_services.dart';
import 'core/theme/app_theme.dart';
import 'core/utility/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await initServices();
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MainApp());
}

Future<void> initServices() async {
  await Get.putAsync(
    () => SettingsService.init(),
  );
  await Get.putAsync(
    () => DioService.init(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: AppTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: routes,
    );
  }
}
