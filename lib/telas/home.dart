import 'package:faceflutter/components/circular_button.dart';
import 'package:faceflutter/components/create_post_area.dart';
import 'package:faceflutter/components/post_area_widget.dart';
import 'package:faceflutter/components/stories_area.dart';
import 'package:faceflutter/data/data.dart';
import 'package:faceflutter/models/post.dart';
import 'package:faceflutter/utils/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            // expandedHeight: 250,
            floating: true,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              CircularButton(
                icon: LineIcons.search, 
                iconSize: 30, 
                onPressed: (){}
              ),
              CircularButton(
                icon: LineIcons.facebookMessenger, 
                iconSize: 30, 
                onPressed: (){}
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostArea(
              user: userLogged,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: StoriesArea(
                user: userLogged,
                stories: stories,
              )
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index){
                Post post = posts[index];
                return PostAreaWidget(post: post);
              },
              childCount: posts.length,
            ),
          ),
      ]),
    );
  }
}