import 'package:cached_network_image/cached_network_image.dart';
import 'package:faceflutter/models/story.dart';
import 'package:flutter/material.dart';

class StoryCardWidget extends StatelessWidget {

  final Story story;

  const StoryCardWidget({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImage,
            width: 110,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}