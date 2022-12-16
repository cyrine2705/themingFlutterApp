import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tp5/MyTheme.dart';

Widget inputField(String label, String hint, IconData iconData,
    TextEditingController controller,
    {bool? typePass,
    TextInputType? inputType,
    String? msgVide,
    String? validateur,
    String? msgValide}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
    child: SizedBox(
      height: 50,
      child: Material(
        elevation: 8,
        shadowColor: Colors.black87,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          style: TextStyle(color: Colors.black),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return msgVide;
            }

            RegExp regExp = RegExp(validateur!);
            if (!regExp.hasMatch(value)) {
              return msgValide;
            }
          },
          obscureText: typePass!,
          keyboardType: inputType,
          controller: controller,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            labelText: label,
            hintText: hint,
            prefixIcon: Icon(iconData),
          ),
        ),
      ),
    ),
  );
}

Widget snackbar(String titre, String msg, ContentType ct) {
  return SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: titre,
      message: msg,
      contentType: ct,
    ),
  );
}
