import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_flower_shop_auth/controller/login_controller.dart';
import 'package:online_flower_shop_auth/core/widget/customtextfield.dart';
import 'package:online_flower_shop_auth/core/widget/quit_on_double_back.dart.dart';
import 'package:online_flower_shop_auth/view/signup_page.dart';

class LoginPage extends StatelessWidget {
  final double _deviceHeight, _deviceWidth;
  final controller = Get.find<LoginController>();
  LoginPage({super.key})
      : _deviceHeight = Get.height,
        _deviceWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffE6F6F6),
        body: QuitOnDoubleBack(
          child: _buildPage(context),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Container(
            height: _deviceHeight,
            width: _deviceWidth,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: _deviceWidth * 0.1,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: _deviceWidth * 0.01, bottom: 30),
                    child: Text(
                      "Login".tr,
                      style: TextStyle(
                        fontSize: _deviceWidth * 0.15,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF3C2367),
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  GetBuilder<LoginController>(
                    id: 'email',
                    builder: (controller) {
                      return CustomTextField(
                        textController: controller.emailController,
                        labelText: "Email",
                        errorText: controller.emailError,
                        keyboardType: TextInputType.emailAddress,
                        onFocusChange: (isFocused) {
                          if (!isFocused) {
                            controller.validateEmail();
                          }
                        },
                        onChanged: (value) {
                          if (controller.emailError != null) {
                            controller.clearEmailError();
                          }
                        },
                      );
                    },
                  ),
                  GetBuilder<LoginController>(
                    id: 'phone',
                    builder: (controller) {
                      return CustomTextField(
                        textController: controller.phoneController,
                        labelText: "Phone Number",
                        errorText: controller.phoneError,
                        keyboardType: TextInputType.phone,
                        onFocusChange: (isFocused) {
                          if (!isFocused) {
                            controller.validatePhone();
                          }
                        },
                        onChanged: (value) {
                          if (controller.phoneError != null) {
                            controller.clearPhoneError();
                          }
                        },
                      );
                    },
                  ),
                  GetBuilder<LoginController>(
                    id: 'password',
                    builder: (controller) => CustomTextField(
                      textController: controller.passwordController,
                      obscureText: controller.hidePassword,
                      labelText: "Password",
                      errorText: controller.passwordError,
                      iconPath: (controller.hidePassword)
                          ? "assets/icons/visibility_off.svg"
                          : "assets/icons/visibility_on.svg",
                      onIconPressed: () {
                        controller.toggleShowPassword();
                      },
                      onFocusChange: (isFocused) {
                        if (!isFocused) {
                          controller.validatePassword();
                        }
                      },
                      onChanged: (value) {
                        if (controller.passwordError != null) {
                          controller.clearPasswordError();
                        }
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Should be none less than 8 characters ".tr,
                        style: const TextStyle(color: Color(0XFF8C8A8C)),
                      ),
                      Text(
                        "Forget password?".tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffff0000),
                        ),
                      ),
                      const SizedBox(height: 66),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account?".tr,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF8C8A8C),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignupPage());
                        },
                        child: Text(
                          " Sign up".tr,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3C2367),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Center(child: _loginButton()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: () {
        // FocusManager.instance.primaryFocus?.unfocus();
        // controller.checkCredentials().then(
        //   (result) {
        //     if (result == true) {
        Get.offNamed('/home');
        //     }
        //   },
        // );
      },
      height: 60,
      minWidth: 220,
      elevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 13,
      ),
      color: const Color(0xFF3C2367),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text("Log in",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }
}
