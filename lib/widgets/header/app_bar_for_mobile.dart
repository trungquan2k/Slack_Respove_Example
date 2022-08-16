import 'package:flutter/material.dart';
import 'package:tiger/models/user_model.dart';
import 'package:tiger/widgets/button/circle_button.dart';
import 'package:tiger/widgets/card/user_card.dart';
import 'package:tiger/widgets/card/work_space_card.dart';
import 'package:tiger/widgets/header/custom_tab_bar.dart';

class CustomAppBarForMobile extends StatelessWidget {
  final User currentUser;

  const CustomAppBarForMobile({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 80.0,
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
      child: Container(
        padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  WorkSpaceCard(user: currentUser),
                  const Spacer(flex: 1),
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
