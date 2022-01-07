import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inri/constants/borders.dart';
import 'package:inri/constants/colors.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hintText;
  final String? label;
  final bool readOnly;
  final Function? iconAction;
  final IconData? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onPressedSuffixIcon;
  final Function(String?)? onChanged;
  final Function(String)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final String? initialValue;
  final Widget? prefix;
  final Widget? sufix;
  final TextInputAction? textInputAction;

  const TextInput(
      {this.controller,
      this.icon,
      this.iconAction,
      this.hintText,
      this.readOnly = false,
      this.suffixIcon,
      this.onPressedSuffixIcon,
      this.obscureText = false,
      this.validator,
      this.textInputType,
      this.label,
      this.onChanged,
      this.onSaved,
      this.inputFormatters,
      this.initialValue,
      this.prefix,
      this.sufix,
      this.textInputAction,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      initialValue: initialValue,
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      keyboardType: textInputType,
      validator: validator,
      onChanged: onChanged,
      textInputAction: textInputAction,
      onFieldSubmitted: (String? value) => onSaved != null ? onSaved!(value ?? '') : null,
      inputFormatters: inputFormatters != null ? inputFormatters : [],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kTextGreyDark),
        labelText: label,
        filled: readOnly,
        fillColor: kTextGreyLight,
        labelStyle: const TextStyle(color: kTextGreyDark),
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedBorder: readOnly ? disableBorder : Theme.of(context).inputDecorationTheme.focusedBorder,
        focusedErrorBorder: errorBorder,
        prefixIcon: icon != null ? Icon(icon) : null,
        suffix: sufix,
        prefix: prefix,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: obscureText ? kTextGreyLight : Theme.of(context).primaryColor),
                onPressed: onPressedSuffixIcon)
            : null,
        contentPadding: const EdgeInsets.all(12),
      ),
    );
  }
}
