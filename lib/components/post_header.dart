import 'package:faceflutter/components/avatar_profile_widget.dart';
import 'package:faceflutter/models/post.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {

  final Post post;

  const PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarProfileWidget(urlImage: post.user.urlImage, isVisualized: true),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name, 
                style: const TextStyle(
                  fontWeight: FontWeight.bold
              )),
              Row(
                children: [
                  Text("${post.timeAgo} - "),
                  Icon(Icons.public, size: 12, color: Colors.grey[600],),
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.more_horiz))
      ]);
  }
}