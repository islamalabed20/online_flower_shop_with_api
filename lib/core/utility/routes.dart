import 'package:get/get.dart';
import 'package:flutter/animation.dart';
import 'package:online_flower_shop_auth/core/middleware/auth_middleware.dart';
import 'package:online_flower_shop_auth/core/utility/app_bindings.dart';
import 'package:online_flower_shop_auth/view/home.dart';
import 'package:online_flower_shop_auth/view/login.dart';
import 'package:online_flower_shop_auth/view/payment.dart';
import 'package:online_flower_shop_auth/view/signup_page.dart';
import 'package:online_flower_shop_auth/view/splash.dart';
import 'package:online_flower_shop_auth/view/verificationcode.dart';

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
  GetPage(
    name: '/authentication',
    page: () => VerificationCodePage(),
    binding: AuthBindings(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  ),
  GetPage(
    name: '/payment',
    page: () => PaymentPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  ),
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    binding: HomeBindings(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: '/',
    page: () => SplashScreen(),
    // binding: HomeBindings(),
    // transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  ),
];
