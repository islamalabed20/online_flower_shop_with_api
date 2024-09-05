import 'package:flutter/material.dart';

class AddressField extends StatelessWidget {
  final String labeltext1;
  final String labeltext2;
  final TextEditingController? controller1;
  final TextEditingController? controller2;

  const AddressField({
    super.key,
    required this.labeltext1,
    required this.labeltext2,
    this.controller1,
    this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller1,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xff455555)
                : Colors.white,
            border: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
            labelText: labeltext1,
            labelStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Color(0xff8C8A8C),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
          ),
        ),

        const Divider(height: 1, color: Colors.grey), // Divider line

        TextField(
          controller: controller2,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xff455555)
                : Colors.white,
            border: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
            labelText: labeltext2,
            labelStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Color(0xff8C8A8C),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
