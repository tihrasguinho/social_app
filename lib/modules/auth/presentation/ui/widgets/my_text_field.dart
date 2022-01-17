import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.formatters,
    this.obscure = false,
    this.focus,
    this.inputType,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;
  final bool obscure;
  final TextInputType? inputType;

  final FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: TextField(
        enableSuggestions: false,
        textAlign: TextAlign.start,
        cursorColor: Colors.white,
        focusNode: focus,
        controller: controller,
        inputFormatters: formatters,
        obscureText: obscure,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).primaryColor,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 0,
          ),
          label: Text(hintText),
          labelStyle: const TextStyle(fontSize: 14),
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
