import 'package:cached_network_image/cached_network_image.dart';
import 'package:faceflutter/components/avatar_profile_widget.dart';
import 'package:faceflutter/models/story.dart';
import 'package:faceflutter/utils/paleta_cores.dart';
import 'package:flutter/material.dart';

class StoryCardWidget extends StatelessWidget {

  final Story story;
  final bool addStory;

  const StoryCardWidget({Key? key, required this.story, this.addStory = false}) : super(key: key);

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
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.storyGradient,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: addStory ?
            Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ), 
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add),
              iconSize: 30,
              color: PaletaCores.azulFacebook,
              onPressed: addStory ? (){} : (){}
            )
          ) 
          : AvatarProfileWidget(
            urlImage: story.user.urlImage,
            isVisualized: story.isVisualized,
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            story.user.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}