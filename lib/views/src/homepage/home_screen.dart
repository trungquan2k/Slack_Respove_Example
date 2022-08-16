// import 'package:flutter/material.dart';
// import 'package:tiger/data/data.dart';
// import 'package:tiger/widgets/bottom/bottom_bar_for_mobile.dart';
// import 'package:tiger/widgets/header/app_bar_for_mobile.dart';
// import 'package:tiger/widgets/responsive/responsive.dart';
// import 'package:tiger/widgets/side-menu/side_menu.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late  int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery
//         .of(context)
//         .size;
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//       appBar: Responsive.isMobile(context) ? PreferredSize(
//         preferredSize: Size(size.width, 100.0),
//         child: const CustomAppBarForMobile(
//           currentUser: currentUser,
//         ),
//       ):null,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tiger/data/data.dart';
import 'package:tiger/widgets/header/app_bar_for_mobile.dart';
import 'package:tiger/widgets/responsive/responsive.dart';
import 'package:tiger/widgets/side-menu/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const ListTileSelectExample();
  }
}


class ListTileSelectExample extends StatefulWidget {
  const ListTileSelectExample({Key? key}) : super(key: key);

  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}
class ListTileSelectExampleState extends State<ListTileSelectExample> {
  bool isSelectionMode = false;
  final int listLength = 30;
  late List<bool> _selected;
  @override
  void initState() {
    super.initState();
    initializeSelection();
  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListBuilder(
          isSelectionMode: isSelectionMode,
          selectedList: _selected,
          onSelectionChange: (bool x) {
            setState(() {
              isSelectionMode = x;
            });
          },
        ));
  }
}

class GridBuilder extends StatefulWidget {
  const GridBuilder({
    Key? key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  }) : super(key: key);

  final bool isSelectionMode;
  final Function(bool)? onSelectionChange;
  final List<bool> selectedList;

  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.selectedList.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () => _toggle(index),
            onLongPress: () {
              if (!widget.isSelectionMode) {
                setState(() {
                  widget.selectedList[index] = true;
                });
                widget.onSelectionChange!(true);
              }
            },
            child: GridTile(
                child: Container(
                  child: widget.isSelectionMode
                      ? Checkbox(
                      onChanged: (bool? x) => _toggle(index),
                      value: widget.selectedList[index])
                      : const Icon(Icons.image),
                )),
          );
        });
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    Key? key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  }) : super(key: key);

  final bool isSelectionMode;
  final List<bool> selectedList;
  final Function(bool)? onSelectionChange;

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.selectedList.length,
        itemBuilder: (_, int index) {
          return ListTile(
              onTap: () => _toggle(index),
              onLongPress: () {
                if (!widget.isSelectionMode) {
                  setState(() {
                    widget.selectedList[index] = true;
                  });
                  widget.onSelectionChange!(true);
                }
              },
              trailing: widget.isSelectionMode
                  ? Checkbox(
                value: widget.selectedList[index],
                onChanged: (bool? x) => _toggle(index),
              )
                  : const SizedBox.shrink(),
              title: Text('item $index'));
        });
  }
}
