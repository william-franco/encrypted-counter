import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:encrypted_counter/providers/bottom_nav_provider.dart';
import 'package:encrypted_counter/screens/counter_screen.dart';
import 'package:encrypted_counter/screens/setting_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  static final tabs = [
    const CounterScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: tabs[navProvider.currentIndex],
      bottomNavigationBar: SafeArea(
        child: CupertinoTabBar(
          currentIndex: navProvider.currentIndex,
          onTap: (index) {
            navProvider.currentIndex = index;
          },
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: Icons.settings,
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
