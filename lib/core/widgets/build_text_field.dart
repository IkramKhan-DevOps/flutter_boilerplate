import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../configs/app_colors.dart';

class BuildTextField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controller;
  final GlobalKey<FormFieldState>? formFieldKey;
  final FocusNode? focusNode;
  final FocusNode? focusNodeTarget;

  final TextInputType keyboardType;
  final int? maxLength;

  const BuildTextField({
    super.key,
    required this.hintText,
    this.labelText,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLength, this.controller,
    this.formFieldKey,
    this.focusNode,
    this.focusNodeTarget,
  });

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured =
        widget.obscureText; // Initialize with the provided obscureText value
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText ?? '',
            style: TextStyle(
              color: colors.secondary,
              fontSize: 12,
            ),
          ),
        if (widget.labelText != null) const SizedBox(height: 5),
        TextField(
          obscureText: isObscured,
          keyboardType: widget.keyboardType,
          cursorColor: AppColors.primary,
          focusNode: widget.focusNode,
          controller: widget.controller,
          maxLength: widget.maxLength,
          onSubmitted: (value){
            if (widget.focusNodeTarget != null){
              FocusScope.of(context).requestFocus(widget.focusNodeTarget);
            }
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      isObscured
                          ? LineIcons.eyeSlash
                          : LineIcons.eye, // Toggle icon
                    ),
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured; // Toggle obscure state
                      });
                    },
                  )
                : null,
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
        ),
      ],
    );
  }
}
