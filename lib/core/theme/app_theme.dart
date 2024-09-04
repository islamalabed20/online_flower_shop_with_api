import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTheme {
  static Color lightGreyColor = const Color(0xFFDDDDDD);
  static Color greyColor = const Color(0xFFAEB3BE);
  static Color darkGreyColor = const Color(0xFF757575);

  static Color blackColor = const Color(0xFF000000);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color offWhiteColor = const Color(0xFFFFFDFD);



  static Color textFieldFillColor = const Color(0xFFFAFFF8);
  static Color textFieldBorderColor = const Color(0xFFD7DDDB);

  static TextStyle textFieldLabelStyle = const TextStyle(
    fontSize: 15,
    fontFamily: "Roboto",
    fontWeight: FontWeight.w500,
    color: Color(0xff8C8A8C),
  );

  static TextStyle buttonTextStyle = const TextStyle(
    fontSize: 17,
    fontFamily: "Roboto",
    fontWeight: FontWeight.w500,
    color: Color(0xff8C8A8C),
  );

  static InputDecoration textFieldDecoration({
    required String labelText,
    String? errorText,
    String? iconPath,
    Size? iconSize,
    void Function()? onPressed,
  }) {
    return InputDecoration(
      constraints: BoxConstraints(
        maxHeight: (errorText != null) ? 51 : 42,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10.0, // Adjust this value to decrease or increase height
        horizontal: 16.0,
      ),
      suffixIcon: (iconPath == null)
          ? null
          : Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MaterialButton(
                onPressed: onPressed,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                //  shape: const CircleBorder(),
                child: SvgPicture.asset(
                  iconPath,
                  
                ),
              ),
            ),
      suffixIconConstraints: (iconPath == null)
          ? null
          : BoxConstraints.loose(
              iconSize ?? const Size(40, 35),
            ),
      labelText: labelText,
      labelStyle: AppTheme.textFieldLabelStyle,
      errorText: errorText,
      errorStyle: const TextStyle(
        height: 0.1,
        fontFamily: 'Cabin',
      ),
      filled: true,
      fillColor: AppTheme.textFieldFillColor,
      focusColor: AppTheme.textFieldFillColor,
      hoverColor: AppTheme.textFieldFillColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.textFieldBorderColor,
          strokeAlign: BorderSide.strokeAlignInside,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(7),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.textFieldBorderColor,
          strokeAlign: BorderSide.strokeAlignInside,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red.shade900,
          strokeAlign: BorderSide.strokeAlignInside,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }

  ///
  ///
  /// Definition of [lightTheme] theme properties
  ///
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Montaga",
    brightness: Brightness.light,
    primaryColor: AppTheme.whiteColor,
    appBarTheme: AppBarTheme(
      surfaceTintColor: AppTheme.whiteColor,
      backgroundColor: AppTheme.whiteColor,
      scrolledUnderElevation: 0,
      shadowColor: const ColorScheme.light().shadow,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppTheme.whiteColor,
      surfaceTintColor: AppTheme.whiteColor,
    ),
    scaffoldBackgroundColor: AppTheme.whiteColor,
    primaryTextTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16,
        color: AppTheme.blackColor,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color(0xff8C8A8C),
      selectionHandleColor: const Color(0xff8C8A8C),
      selectionColor: const Color(0xff8C8A8C).withOpacity(0.5),
    ),
  );

  ///
  ///
  /// Definition of [darkTheme] theme properties
  ///
  static ThemeData darkTheme = ThemeData(
    fontFamily: "Montaga",
    brightness: Brightness.dark,
    primaryColor: AppTheme.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.blackColor,
      surfaceTintColor: AppTheme.blackColor,
      shadowColor: const ColorScheme.dark().shadow,
    ),
    scaffoldBackgroundColor: AppTheme.blackColor,
    primaryTextTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16,
        color: AppTheme.whiteColor,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color(0xff8C8A8C),
      selectionHandleColor: const Color(0xff8C8A8C),
      selectionColor: const Color(0xff8C8A8C).withOpacity(0.5),
    ),
  );
}
