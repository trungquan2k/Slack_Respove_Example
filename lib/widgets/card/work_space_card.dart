import 'package:flutter/material.dart';
import 'package:tiger/constant/palette.dart';
import 'package:tiger/models/user_model.dart';
import 'package:tiger/widgets/card/icon_work_space.dart';

class WorkSpaceCard extends StatelessWidget {
  final User user;

  const WorkSpaceCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconWorkSpace(imageUrl: user.imageUrl),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              user.name,
              style: const TextStyle(fontSize: 22.0,color: Palette.scaffold, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
