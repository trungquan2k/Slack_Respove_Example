import 'package:flutter/material.dart';
import 'package:tiger/data/data.dart';
import 'package:tiger/widgets/bottom/bottom_tabs.dart';
import 'package:tiger/widgets/header/app_bar_for_mobile.dart';
import 'package:tiger/widgets/responsive/responsive.dart';
import 'package:tiger/widgets/side-menu/side_menu.dart';

// ignore: must_be_immutable
class TabsPage extends StatefulWidget {
  int selectedIndex ;

  TabsPage({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();

}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      _selectedIndex = widget.selectedIndex;
    });
  }
  @override
  void initState() {
    _onItemTapped(widget.selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const SideMenu(),
      appBar:  Responsive.isMobile(context) ? PreferredSize(
        preferredSize: Size(size.width, 100.0),
        child: const CustomAppBarForMobile(
          currentUser: currentUser,
        ),
      ):null,
      body: Scaffold(
        body: IndexedStack(
          index: widget.selectedIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0)),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'DMs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              label: 'Mentions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),z.0
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey.shade400,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 50),
          elevation: 10,
        ),
      )
    );
  }
}