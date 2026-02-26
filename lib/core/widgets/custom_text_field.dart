import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? inputType;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.suffexIcon,
    required this.onSaved,
    required this.onChanged,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFFCCCCCC)),
        ),
      ),
    );
  }
}
