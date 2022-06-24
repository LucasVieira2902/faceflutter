import 'package:cached_network_image/cached_network_image.dart';
import 'package:faceflutter/components/story_card_widget.dart';
import 'package:faceflutter/models/story.dart';
import 'package:faceflutter/models/user.dart';
import 'package:flutter/material.dart';

class StoriesArea extends StatelessWidget {

  final User user;
  final List<Story> stories;

  const StoriesArea({Key? key, required this.user, required this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          final Story story;
          if(index == 0){
            story = Story(
              user: user,
              urlImage: user.urlImage,
              isVisualized: true,
            );
          }else{
            story = stories[index-1];
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: StoryCardWidget(story: story, addStory: index == 0),
          );
        },
      ),
    );
  }
}