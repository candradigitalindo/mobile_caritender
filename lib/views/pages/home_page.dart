import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:tender_mobile/shared/theme.dart';
import 'package:tender_mobile/views/pages/filter_tender_page.dart';
import 'package:tender_mobile/views/pages/tender_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widget = [
      Center(
        child: Text('Home'),
      ),
      const TenderPage(),
      const FilterTenderPage(),
      Center(
        child: Text('Keyword'),
      ),
      Center(
        child: Text('Logout'),
      ),
    ];
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: widget[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.assignment, title: 'Tender'),
          TabItem(icon: Icons.checklist, title: 'Filter'),
          TabItem(icon: Icons.message, title: 'Keywords'),
          TabItem(icon: Icons.logout, title: 'Keluar'),
        ],
        initialActiveIndex: 0,
        backgroundColor: orangeColor,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
