import 'package:flutter/material.dart';
import 'package:tiger/models/user_model.dart';
import 'package:tiger/widgets/card/profile_avatar.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
        ],
      ),
    );
  }
}
