import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String labeltext;
  final TextEditingController? mycontroller;
  final bool isNumber;
  final bool isPasswordField;
  final bool obscureText;
  final Icon? icon;
  final VoidCallback? onTapIcon;

  const CustomTextFormAuth({
    super.key,
    required this.labeltext,
    this.mycontroller,
    required this.isNumber,
    this.isPasswordField = false,
    this.obscureText = false,
    this.icon,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
  

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        controller: mycontroller,
       
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          labelText: labeltext ,contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0, // Adjust this value to decrease or increase height
            horizontal: 16.0,
          ),
         
        
        ),
      ),
    );
  }
}
