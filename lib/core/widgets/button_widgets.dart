import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../configs/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String? title;
  final double? height;
  final Widget? child;
  final bool? outlinedButton;

  const AppPrimaryButton({
    super.key,
    required this.onPressed,
    this.title,
    this.height,
    this.child,
    this.outlinedButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 50,
        padding: const EdgeInsets.all(4.0),
        decoration: outlinedButton == null || outlinedButton == false
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(30), // Rounded edges
                gradient: LinearGradient(
                  colors: [
                    Colors.red[900]!,
                    Colors.redAccent,
                    Colors.red[400]!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue[900]!.withOpacity(0.3),
                    // Reduced opacity for subtle effect
                    blurRadius: 1,
                    // Smaller blur radius for a less pronounced shadow
                    offset: const Offset(
                        2, 2), // Smaller offset to reduce the shadow's spread
                  ),
                  BoxShadow(
                    color: Colors.blue[300]!.withOpacity(0.2),
                    // Reduced opacity for subtle effect
                    blurRadius: 2,
                    // Smaller blur radius for a less pronounced shadow
                    offset: const Offset(
                        -0, -2), // Smaller offset for minimal effect
                  ),
                ],
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(30), // Rounded edges
                color: Colors.transparent,
                border: Border.all(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  width: 1,
                ),
              ),
        child: Center(
          child: child ?? _buildText(),
        ),
      ),
    );
  }

  _buildText() {
    return Text(
      title ?? 'Submit',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ButtonIconLabel extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color? color;

  const ButtonIconLabel({super.key, this.title, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon != null
            ? Icon(
                icon,
                size: 20,
                color: color ?? colors.secondary,
              )
            : const SizedBox.shrink(),
        icon != null ? const SizedBox(width: 5) : const SizedBox.shrink(),
        Text(
          title ?? 'SUBMIT',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color ?? colors.secondary,
          ),
        ),
      ],
    );
  }
}

class SmallButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final IconData? icon;

  const SmallButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 50,
      width: 180,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: colors.primary,
          backgroundColor: colors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: colors.primary,
              width: 2,
            ),
          ),
          elevation: 0,
        ),
        onPressed: () => onPressed(),
        child: ButtonIconLabel(
          title: title,
          icon: icon ?? Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}

