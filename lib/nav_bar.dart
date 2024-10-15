import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tracer_alumni_v1/view/fakultas_view.dart';
import 'package:tracer_alumni_v1/view/mhs_view.dart';
import 'package:tracer_alumni_v1/view/prodi_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> pages = [ProdiView(),FakultasView(),MhsView()];
  int pageCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.book),
          Icon(Icons.school),
          Icon(Icons.person),
        ],
        onTap: (value) => setState(
          () {
            pageCount = value;
          },
        ),
      ),
      body: pages[pageCount],
    );
  }
}
