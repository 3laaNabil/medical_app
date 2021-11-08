import 'package:flutter/material.dart';
import 'package:medical_app/constants.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(dynamic val)? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  bool autofocus = false,

}) {
  return TextFormField(

      controller: controller,
      autofocus: autofocus,
      obscureText: isPassword,
      onTap: () => onTap ?? () {},
      onChanged: (value) => onChange ?? (value),
      onFieldSubmitted: (value) => onSubmit!(value),
      validator: (value) {
        return validate!(value);
      },
      decoration:  InputDecoration(

        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: sColor),
        ),
        border:const OutlineInputBorder(

          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: label,
        labelStyle: TextStyle(color: sColor),
        prefixIcon: Icon(

          prefix,
          color: sColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          color: sColor,
          onPressed: () => suffixPressed,
          icon: Icon(

            suffix,
          ),
        )
            : null,
      ),);
}