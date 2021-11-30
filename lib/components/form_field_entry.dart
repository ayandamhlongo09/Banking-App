import 'package:banking_app/constants/app_colors.dart';
import 'package:banking_app/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldEntry extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final void Function(String) onSaved;
  final String hintText;
  final TextStyle hintStyle;
  final String Function(String) validator;
  final TextInputAction textInputAction;
  final void Function() onEditingComplete;
  final Widget suffixIcon;
  final void Function(String) onFieldSubmitted;
  final FocusNode focusNode;
  final AutovalidateMode autovalidateMode;
  final String initialValue;
  final bool autofocus;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;

  FormFieldEntry({
    this.title,
    this.textAlign = TextAlign.left,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.hintStyle = const TextStyle(color: Colors.grey, fontSize: 15.0),
    this.validator = validateString,
    this.textInputAction = TextInputAction.next,
    this.onEditingComplete,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.focusNode,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.initialValue,
    this.autofocus = false,
    this.obscureText = false,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: title != null
              ? Text(
                  title,
                  textAlign: TextAlign.left,
                )
              : null,
        ),
        TextFormField(
          inputFormatters: inputFormatters,
          //styles cursor next to underlining line
          cursorColor: AppColors.primary,
          autofocus: autofocus,
          initialValue: initialValue,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onSaved: onSaved,
          decoration: InputDecoration(
            //styles the underlining line
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            hintText: hintText,
            hintStyle: hintStyle,
            suffixIcon: suffixIcon,
          ),
          validator: validator,
          textInputAction: textInputAction,
          onEditingComplete: onEditingComplete,
          focusNode: focusNode,
          autovalidateMode: autovalidateMode,
          obscureText: obscureText,
        )
      ],
    );
  }
}
