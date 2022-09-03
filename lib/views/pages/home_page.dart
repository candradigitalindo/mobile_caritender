import 'package:flutter/material.dart';
import 'package:tender_mobile/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: blueColor,
        unselectedItemColor: blackColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: blueTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        unselectedLabelStyle: blackTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/fi_layers.png',
              width: 20,
              color: blueColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/fi_repeat.png',
              width: 20,
            ),
            label: 'Filter',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/fi_file-text.png',
              width: 20,
            ),
            label: 'Keyword',
          ),
        ],
      ),
    );
  }
}
