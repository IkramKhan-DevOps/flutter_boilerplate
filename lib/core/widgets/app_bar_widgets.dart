import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../configs/app_images.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final double? leadingWidth;
  final bool? centerTitle;
  final List<Widget>? actions;

  const MyAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.centerTitle,
    this.leadingWidth,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: centerTitle ?? true,
      title: title ??
          Image.asset(
            AppImages.logoLight,
            height: 50,
            width: 50,
          ),
      elevation: 0,
      leadingWidth: leadingWidth ?? 50,
      leading: leading ??
          IconButton(
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                size: 15,
                Icons.arrow_back_ios_new,
                color: colors.secondary,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarShort extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? centerTitle;
  final Widget? content;
  final List<Widget>? actions;

  const AppBarShort(
      {super.key, this.title, this.centerTitle, this.actions, this.content});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colors.background.withOpacity(0.5),
      centerTitle: centerTitle ?? true,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          LineIcons.arrowLeft,
        ),
      ),
      title: content ??
          Text(
            title ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
      actions: actions,
    );
  }

  // Define the preferred size (height) for the app bar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAuth({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: colors.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            LineIcons.arrowLeft,
            color: colors.secondary,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(''),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarTitleSubtitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const AppBarTitleSubtitleWidget(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class AppBarIconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final bool? isBackgroundColored;

  const AppBarIconButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isBackgroundColored = true,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: isBackgroundColored!
              ? Colors.black.withOpacity(0.3)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
