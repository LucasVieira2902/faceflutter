import 'package:faceflutter/components/avatar_profile_widget.dart';
import 'package:faceflutter/models/user.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {

  final User user;
  final VoidCallback onTap;

  const ProfileButton({Key? key, required this.user, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AvatarProfileWidget(urlImage: user.urlImage, isVisualized: true),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              user.name,
              style: const TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}