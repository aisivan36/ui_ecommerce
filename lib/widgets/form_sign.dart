import 'package:flutter/material.dart';

enum IsIconForm {
  valid,
  notValid,
  none,
}

class FormSign extends StatelessWidget {
  const FormSign({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
    required this.isIconForm,
    this.isPasswordForm = false,
    this.onTap,
    this.validator,
  });

  final TextEditingController controller;

  final void Function(String? value)? onChanged;
  final String? Function(String? value)? validator;
  final void Function()? onTap;

  final IsIconForm isIconForm;
  final String labelText;
  final bool isPasswordForm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 74,
      // width: 343,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        validator: validator,
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
          suffixIcon: _sufficIcon(),
          fillColor: const Color(0xff2a2b36),
          filled: true,
        ),
      ),
    );
  }

  Widget _sufficIcon() {
    switch (isIconForm) {
      case IsIconForm.valid:
        return const Icon(
          Icons.done,
          color: Color(0xff55d75a),
        );
      case IsIconForm.notValid:
        return const Icon(
          Icons.clear,
          color: Color(0xFFEC1B1B),
        );

      default:
        return const SizedBox();
    }
  }
}
