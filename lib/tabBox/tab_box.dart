import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework12/Screen/subject_screen/subject_screen.dart';
import 'package:homework12/tabBox/profile/profile_screen.dart';
import 'package:homework12/utils/color/color.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  StreamController<bool> streamController=StreamController<bool>();
  List<Widget> screens = [const SubjectScreen(),const ProfileScreen()];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[activeIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.c_273032,
          currentIndex: activeIndex,
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },

          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white.withOpacity(0.3),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size:30,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,size:30,),
              label: "Profile",
            )
          ],
        ),
    );
  }
}
