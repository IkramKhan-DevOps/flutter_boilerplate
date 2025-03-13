import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


class MobileView extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChanged;
  final List<Widget> widgetOptions;

  const MobileView({
    super.key,
    required this.currentIndex,
    required this.onTabChanged,
    required this.widgetOptions,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: false,
      body: widgetOptions[currentIndex],
      bottomNavigationBar: CrystalNavigationBar(
        marginR: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        enablePaddingAnimation: true,
        unselectedItemColor: Colors.white70,
        outlineBorderColor: Colors.transparent,
        backgroundColor: colors.primary.withOpacity(0.5),
        splashColor: Colors.transparent,
        indicatorColor: Colors.white,
        curve: Curves.easeInOut,
        currentIndex: currentIndex,
        items: [
          CrystalNavigationBarItem(
            icon: LineIcons.home,
            unselectedIcon: LineIcons.home,
            selectedColor: Colors.grey[100],
            unselectedColor: Colors.grey[500],
          ),
          // SHOW IF SALE ALLOWED
          CrystalNavigationBarItem(
            icon: LineIcons.shoppingBag,
            unselectedIcon: LineIcons.shoppingBag,
            selectedColor: Colors.grey[100],
            unselectedColor: Colors.grey[500],
          ),
          CrystalNavigationBarItem(
            icon: LineIcons.cog,
            unselectedIcon: LineIcons.cog,
            selectedColor: Colors.grey[100],
            unselectedColor: Colors.grey[500],
          ),
        ],
        onTap: onTabChanged,
      ),
    );
  }
}
