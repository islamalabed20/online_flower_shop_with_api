import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/signup_controller.dart';
import 'package:online_flower_shop_auth/core/theme/app_theme.dart';
import 'package:online_flower_shop_auth/core/widget/customtextfield.dart';
import 'package:online_flower_shop_auth/core/widget/image_picker_dialog.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final controller = Get.put(SignupController());

  Widget _buildPage(BuildContext context) {
    return GestureDetector(
      // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFE6F6F6),
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.asset('assets/images/Rectangle22.png'),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.5,
                top: MediaQuery.of(context).size.height * 0.01,
                child: Image.asset(
                  'assets/images/download1.png',
                  width: 170,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 70),
                      Text(
                        'Sign Up'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      _selectProfilePicture(),
                      const SizedBox(height: 10),
                      Text("Add Profile Photo".tr),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GetBuilder<SignupController>(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GetBuilder<SignupController>(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GetBuilder<SignupController>(
                          id: 'username',
                          builder: (controller) {
                            return CustomTextField(
                              textController: controller.usernameController,
                              labelText: "Username",
                              errorText: controller.usernameError,
                              onFocusChange: (isFocused) {
                                if (!isFocused) {
                                  controller.validateUsername();
                                }
                              },
                              onChanged: (value) {
                                if (controller.usernameError != null) {
                                  controller.clearUsernameError();
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GetBuilder<SignupController>(
                          id: 'password',
                          builder: (controller) {
                            return CustomTextField(
                              textController: controller.passwordController,
                              labelText: "Password",
                              errorText: controller.passwordError,
                              obscureText: controller.hidePassword,
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
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: GetBuilder<SignupController>(
                          id: 'confirm_password',
                          builder: (controller) {
                            return CustomTextField(
                              textController:
                                  controller.confirmPasswordController,
                              labelText: "Re Password",
                              errorText: controller.confirmPasswordError,
                              obscureText: controller.hideConfirmPassword,
                              iconPath: (controller.hideConfirmPassword)
                                  ? "assets/icons/visibility_off.svg"
                                  : "assets/icons/visibility_on.svg",
                              onIconPressed: () {
                                controller.toggleShowConfirmPassword();
                              },
                              onFocusChange: (isFocused) {
                                if (!isFocused) {
                                  controller.validateConfirmPassword();
                                }
                              },
                              onChanged: (value) {
                                if (controller.confirmPasswordError != null) {
                                  controller.clearConfirmPasswordError();
                                }
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        // height: _deviceHeight * 0.12,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              _selectCertificateButton(),
                              _showPickedCertificate(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      _signupButton(),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 13,
                              color: Color(0xff8C8A8C),
                            ),
                          ),
                          _loginButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GetBuilder<SignupController> _showPickedCertificate() {
    return GetBuilder<SignupController>(
      id: 'certificate',
      builder: (controller) {
        if (controller.certificate != null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.certificate!.name,
                style: const TextStyle(
                  fontFamily: 'Cabin',
                  fontSize: 14,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.clearCertificate();
                },
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.close,
                  size: 18,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _selectCertificateButton() {
    return MaterialButton(
      onPressed: () {
        controller.pickFile();
      },
      color: AppTheme.textFieldFillColor,
      elevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Upload PDF ",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff8C8A8C),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: Image.asset('assets/images/pdf-file1.png'),
          )
        ],
      ),
    );
  }

  Widget _selectProfilePicture() {
    return MaterialButton(
      onPressed: () {
        ImagePickerDialog.showDialog();
      },
      shape: const CircleBorder(),
      child: GetBuilder<SignupController>(
        id: 'profile_picture',
        builder: (controller) {
          if (controller.image != null) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(controller.image!),
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else {
            return const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFD9D9D9),
              child: Icon(Icons.person_2_rounded, size: 40, color: Colors.grey),
            );
          }
        },
      ),
    );
  }

  Widget _signupButton() {
    return MaterialButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        controller.checkCredentials().then(
          (result) {
            if (result == true) {
              Get.toNamed('/authentication');
            }
          },
        );
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
      child: const Text("Sign up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _loginButton() {
    return TextButton(
      onPressed: () {
        Get.offAllNamed('/login');
      },
      style: const ButtonStyle(
        visualDensity: VisualDensity.compact,
        padding: WidgetStatePropertyAll(
          EdgeInsets.zero,
        ),
        overlayColor: WidgetStatePropertyAll(
        Color(0xff8C8A8C),
        ),
      ),
      child: const Text(
        "Login",
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 13,
          color: Color(0xff3C2367),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }
}
