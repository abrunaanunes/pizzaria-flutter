import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final enabled;
  final TextEditingController? controller;

  const CustomTextField(
      {super.key,
      required this.label,
      this.isSecret = false,
      this.inputFormatters,
      this.validator,
      this.enabled,
      this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    isObscure = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        obscureText: isObscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.black),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}
