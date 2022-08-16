import 'package:flutter/material.dart';
import 'package:tiger/constant/constants.dart';
import 'package:tiger/constant/theme_image.dart';
import 'package:tiger/widgets/extensions/extensions.dart';
import 'package:tiger/widgets/responsive/responsive.dart';
import 'package:tiger/widgets/side-menu/widgets/side_menu_items.dart';
import 'package:tiger/widgets/side-menu/widgets/tags.dart';
import 'package:websafe_svg/websafe_svg.dart';


import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: Responsive.isMobile(context) ? 320 : screenWidth,
      padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: const Color.fromRGBO(82, 38, 83, 1),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              Directionality(
                textDirection: TextDirection.rtl,
                child: FlatButton.icon(
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: const Color.fromRGBO(82, 38, 83, 1),
                  onPressed: () {},
                  mouseCursor: MouseCursor.defer,
                  icon: WebsafeSvg.asset(ThemeImage.icMailBox, width: 24),
                  label: const Text(
                    "Tripadvisor",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, ),
                  ),
                ),
              ),
              // Menu Items
              SideMenuItem(
                press: () {},
                title: "Inbox",
                iconSrc: "assets/images/edit_message.svg",
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Sent",
                iconSrc: "assets/icons/Edit.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: "assets/icons/edit_message.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: "assets/icons/edit_message.svg",
                isActive: false,
                showBorder: false,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              // Tags
              const Tags(),
            ],
          ),
        ),
      ),
    );
  }
}