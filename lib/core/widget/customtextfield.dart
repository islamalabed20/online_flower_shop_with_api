import 'package:flutter/material.dart';
import 'package:online_flower_shop_auth/core/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? errorText;
  final String? iconPath;
  final Size? iconSize;
  final void Function()? onIconPressed;
  final void Function(bool isFocused)? onFocusChange;
  final void Function(String value)? onChanged;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.textController,
    this.errorText,
    this.iconPath,
    this.iconSize,
    this.onIconPressed,
    this.onFocusChange,
    this.onChanged,
    this.keyboardType,
    bool? obscureText,
  }) : obscureText = obscureText ?? false;

  @override
  Widget build(BuildContext context) {
    return _buildWidget(context);
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: (errorText != null) ? 17 : 26,
      ),
      child: Focus(
        onFocusChange: onFocusChange,
        child: TextFormField(
          keyboardType: keyboardType,
          controller: textController,
          obscureText: obscureText,
          autofocus: false,
          magnifierConfiguration: const TextMagnifierConfiguration(
            shouldDisplayHandlesInMagnifier: false,
          ),
          // style: AppTheme.textFieldLabelStyle.copyWith(
          //   color: Color(0xff8C8A8C),
          // ),
          // onEditingComplete: onEditingComplete,
          onChanged: onChanged,
          decoration: AppTheme.textFieldDecoration(
            labelText: labelText,
            errorText: errorText,
            iconPath: iconPath,
            iconSize: iconSize,
            onPressed: onIconPressed,
            context: context,
          ),
        ),
      ),
    );
  }
}
