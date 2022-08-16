
import 'package:flutter/material.dart';
import 'package:tiger/widgets/bottom/tabs_page.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/images/flutter_logo.png'))),
            child: Text(
              'Discover Sri Lanka',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TabsPage(selectedIndex: 0)),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TabsPage(selectedIndex: 1)),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Profile'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TabsPage(selectedIndex: 2)),
              ),
            },
          ),

        ],
      ),
    );
  }
}