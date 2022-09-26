import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    required this.hintText,
    this.hintStyle,
    this.textStyle,
    this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      textAlign: TextAlign.center,
      validator: validator,
      controller: controller,
      decoration: InputDecoration.collapsed(
        hintText: hintText,
        hintStyle: hintStyle ??
            _textTheme.headline4!
                .copyWith(color: AppColors.quickSilver.withOpacity(.3)),
      ),
      style: textStyle ?? _textTheme.headline4,
      onChanged: onChanged,
    );
  }
}
