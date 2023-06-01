// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    required this.label,
    required this.changeFunc,
    this.textInputType,
    this.obsecu,
    this.suffixWidget,
    this.prefixWidget,
    this.marginTop,
  }) : super(key: key);

  final String label;
  final Function(String) changeFunc;
  final TextInputType? textInputType;
  final bool? obsecu;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final double? marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.grey.shade300),
      width: 250,
      height: 40,
      margin: EdgeInsets.only(top: marginTop ?? 16),
      child: TextFormField(
        obscureText: obsecu ?? false,
        keyboardType: textInputType,
        onChanged: changeFunc,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          border: InputBorder.none,
          suffixIcon: suffixWidget,
          prefixIcon: prefixWidget,
          labelText: label,
          // filled: true,
        ),
      ),
    );
  }
}
