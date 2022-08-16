import 'package:flutter/material.dart';
import 'package:tiger/models/user_model.dart';
import 'package:tiger/widgets/button/circle_button.dart';
import 'package:tiger/widgets/card/user_card.dart';
import 'package:tiger/widgets/header/custom_tab_bar.dart';

class CustomAppBarForWeb extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBarForWeb({
    Key? key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(53, 13, 54, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(flex: 1),
          SizedBox(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar( icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(
                    Icons.help_outline,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12.0),
                UserCard(user: currentUser),
                const SizedBox(width: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
