import 'package:flutter/material.dart';
import 'package:school_app/core/constants/color_manager.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.isPassword = false,
    this.prefix,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Widget? prefix;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hintText: widget.hintText,
        prefixIcon: widget.prefix,
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: ColorManager.primaryColor.withAlpha(100),),
                  
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : null,
      ),
    );
  }
}
