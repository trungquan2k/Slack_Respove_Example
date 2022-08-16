import 'package:flutter/material.dart';
import 'package:tiger/data/data.dart';
import 'package:tiger/views/src/homepage/home_screen.dart';
import 'package:tiger/views/src/signin/login_screen.dart';
import 'package:tiger/widgets/bottom/tabs_page.dart';
import 'package:tiger/widgets/header/app_bar_for_web.dart';
import 'package:tiger/widgets/responsive/responsive.dart';
import 'package:tiger/widgets/side-menu/side_menu.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _MainScreen();
}


class _MainScreen extends State<NavScreen> {

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.menu,
  ];

  final _iconMobile = Icons.filter;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,  // Added
        initialIndex: 0,
        child : Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
            preferredSize: Size(size.width, 100.0),
            child: CustomAppBarForWeb(
              currentUser: currentUser,
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
          ): null,
          body: Responsive(
              mobile: TabsPage( selectedIndex: 0,),
              tablet: Row(
                children: const [
                  Expanded(
                    flex: 6,
                    child: SideMenu(),
                  ),
                ],
              ),
              desktop: Row(
                children: const [
                  Expanded(
                    flex: 2,
                    child:  SideMenu(),
                  ),
                  Expanded(
                    flex: 8,
                    child: LoginScreen(),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

// Responsive.isMobile(context) ? PreferredSize(
// preferredSize: Size(size.width, 100.0),
// child: CustomAppBarForMobile(
// currentUser: currentUser,
// icons: _icons,
// selectedIndex: _selectedIndex,
// onTap: (index) => setState(() => _selectedIndex = index),
// ),
// ) :