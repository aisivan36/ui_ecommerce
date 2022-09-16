import 'package:flutter/material.dart';

class FormSign extends StatelessWidget {
  const FormSign({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
    required this.isForm,
    this.isPasswordForm = false,
  });

  final TextEditingController controller;

  final String Function(String? value)? onChanged;

  final bool isForm;
  final String labelText;
  final bool isPasswordForm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 64,
      // width: 343,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: isPasswordForm,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xffabb4bd),
            fontSize: 15,
          ),
          suffixIcon: isForm
              ? const Icon(
                  Icons.done,
                  color: Color(0xff55d75a),
                )
              : const SizedBox(),
          fillColor: const Color(0xff2a2b36),
          filled: true,
        ),
      ),
    );
  }
}
