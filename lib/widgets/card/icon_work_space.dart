import 'package:flutter/material.dart';
import 'package:tiger/constant/palette.dart';
import 'package:tiger/widgets/responsive/responsive.dart';

class IconWorkSpace extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const IconWorkSpace({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(Responsive.isMobile(context))
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child:Image.asset(
              'assets/icons/slack_icon.png',
              width: 30,
            ),
          ) ,
            isActive ? Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                height: 15.0,
                width: 15.0,
              decoration: BoxDecoration(
                color: Palette.online,
                shape: BoxShape.circle,
              border: Border.all(
                width: 2.0,
                color: Colors.white,
              )))): const SizedBox.shrink(),
      ],
    );
  }
}
