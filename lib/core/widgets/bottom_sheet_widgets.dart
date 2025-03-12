import 'package:flutter/material.dart';

import '../configs/app_colors.dart';

class TermsBottomSheetWidget extends StatelessWidget {
  final Function onTap;
  final String leftText;
  final String rightText;
  final Color? backgroundColor;
  final Color foregroundColor;

  const TermsBottomSheetWidget({
    super.key,
    required this.onTap,
    required this.leftText,
    required this.rightText,
    this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          border: Border.all(
            color: Colors.transparent,
            width: 0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: leftText,
              style: TextStyle(
                fontSize: size.height / 70,
                color: foregroundColor.withOpacity(0.5),
              ),
            ),
            TextSpan(
              text: rightText,
              style: TextStyle(
                color: foregroundColor,
                fontWeight: FontWeight.bold,
                fontSize: size.height / 70,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class StatusBottomSheetWidget extends StatelessWidget {
  final String status;
  const StatusBottomSheetWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          fontSize: 10,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

