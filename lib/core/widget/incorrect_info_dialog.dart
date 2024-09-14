import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/core/theme/app_theme.dart';

class IncorrectInfoDialog extends StatelessWidget {
  final String? title, content;
  const IncorrectInfoDialog({
    super.key,
    this.title,
    this.content,
  });

  static void showDialog({
    String? title,
    String? content,
  }) {
    Get.dialog(
      IncorrectInfoDialog(
        title: title,
        content: content,
      ),
      barrierColor: AppTheme.whiteColor.withOpacity(0.6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.offWhiteColor.withOpacity(0.9),
      surfaceTintColor: AppTheme.offWhiteColor.withOpacity(0.9),
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        height: 260,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: AppTheme.greyColor,
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title ?? "Sorry!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Cabin',
                      color:Color(0xff8C8A8C),
                      fontSize: 32,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    content ?? "Incorrect password or email",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Cabin',
                      color: Color(0xff8C8A8C),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                "assets/icons/face_in_border.svg",
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
