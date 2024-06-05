import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constanst/app_colors.dart';
import '../constanst/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const CustomTextFormField({
    super.key,
    this.padding,
    this.hintText = '',
    this.labelText = '',
    required this.textCapitalization,
    required this.controller,
    required this.keyboardType,
    this.maxLength,
    this.textInputAction,
    this.suffixIcon,
    this.obscureText,
    this.inputFormatters,
    this.validator,
    this.helperText,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  final OutlineInputBorder _defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greenLightOne,
    ),
  );

  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
      child: TextFormField(
        onChanged:(value) {
          if(value.length == 1){
            setState(() {
              _helperText = null;
            });
          } else if (value.isEmpty){
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        validator: widget.validator,
        style: AppTextStyle.inputText.copyWith(color: AppColors.greenLightOne),
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textCapitalization: widget.textCapitalization,
        decoration: InputDecoration(
          errorMaxLines: 3,
          helperText: _helperText,
          helperMaxLines: 3,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyle.inputLabelText.copyWith(
            color: AppColors.grey,
          ),
          border: _defaultBorder,
          focusedBorder: _defaultBorder,
          errorBorder: _defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: _defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: _defaultBorder,
          disabledBorder: _defaultBorder,
        ),
      ),
    );
  }
}
