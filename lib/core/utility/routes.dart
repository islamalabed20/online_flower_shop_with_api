import 'package:get/get.dart';
import 'package:flutter/animation.dart';
import 'package:online_flower_shop_auth/core/middleware/auth_middleware.dart';
import 'package:online_flower_shop_auth/core/utility/app_bindings.dart';
import 'package:online_flower_shop_auth/view/home.dart';
import 'package:online_flower_shop_auth/view/login.dart';
import 'package:online_flower_shop_auth/view/signup_page.dart';

final routes = [
  GetPage(
    name: '/login',
    page: () => LoginPage(),
    binding: LoginBindings(),
    middlewares: [
      AuthMiddleware(),
    ],
    transition: Transition.upToDown,
    transitionDuration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  ),
  GetPage(
    name: '/signup',
    page: () => SignupPage(),
    binding: SignupBindings(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  ),

  // GetPage(
  //   name: '/authentication',
  //   page: () => AuthenticationPage(),
  //   binding: AuthBindings(),
  //   transition: Transition.rightToLeft,
  //   transitionDuration: const Duration(milliseconds: 500),
  //   curve: Curves.easeInOut,
  // ),
  GetPage(
    name: '/home',
    page: () => HomePage(),
    binding: HomeBindings(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  ),
];
