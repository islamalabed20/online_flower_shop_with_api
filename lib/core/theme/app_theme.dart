import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTheme {
  // Define color palette

  static const Color greyColor = Color(0xFFAEB3BE);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xffE6F6F6);
  static const Color offWhiteColor = Color(0xFFFFFDFD);

  static const Color textFieldFillColorLight = Color(0xFFFAFFF8);
  static const Color textFieldBorderColor = Color(0xFFD7DDDB);

  // Text styles

  static TextStyle textFieldLabelStyle(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      fontSize: 15,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w500,
      color: isDarkMode
          ? Colors.white
          : const Color(0xff8C8A8C), // Set color dynamically
    );
  }

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 17,
    fontFamily: "Roboto",
    fontWeight: FontWeight.w500,
    color: Color(0xff8C8A8C),
  );

  // Input decoration for text fields
  static InputDecoration textFieldDecoration({
    required BuildContext context,
    required String labelText,
    String? errorText,
    String? iconPath,
    Size? iconSize,
    void Function()? onPressed,
  }) {
    // Determine the fill color based on current theme mode
    Color fillColor = Theme.of(context).brightness == Brightness.light
        ? AppTheme.textFieldFillColorLight
        : const Color(0xff455555);

    return InputDecoration(
      constraints: BoxConstraints(
        maxHeight: errorText != null ? 51 : 42,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 16.0,
      ),
      suffixIcon: iconPath == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MaterialButton(
                onPressed: onPressed,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SvgPicture.asset(iconPath),
              ),
            ),
      suffixIconConstraints: iconPath == null
          ? null
          : BoxConstraints.loose(iconSize ?? const Size(40, 35)),
      labelText: labelText,
      labelStyle: AppTheme.textFieldLabelStyle(context),
      errorText: errorText,
      errorStyle: const TextStyle(
        height: 0.1,
        fontFamily: 'Roboto',
      ),
      filled: true,
      fillColor: fillColor,
      focusColor: fillColor,
      hoverColor: fillColor,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppTheme.textFieldBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppTheme.textFieldBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppTheme.textFieldBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red.shade900,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }

  // Light theme definition
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppTheme.whiteColor,
    scaffoldBackgroundColor: AppTheme.whiteColor,
  );

  // Dark theme definition
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppTheme.blackColor,
    scaffoldBackgroundColor: const Color(0xff455555),
  );
}
