import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/dashboard/dashboard_screen.dart';
import 'package:flutter_boilerplate/products/products_screen.dart';
import 'package:flutter_boilerplate/services/bnb/view/mobile_view.dart';
import 'package:flutter_boilerplate/services/onboarding/splash_screen.dart';
import 'package:flutter_boilerplate/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex  = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    ProductsScreen(),
    SettingsScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MobileView(
      currentIndex: _currentIndex,
      onTabChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      widgetOptions: _widgetOptions,
    );
  }
}
