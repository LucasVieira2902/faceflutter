import 'package:faceflutter/models/user.dart';

class Post {
  User user;
  String description;
  String timeAgo;
  String urlImage;
  int likes;
  int comments;
  int shares;

  Post({
    required this.user,
    required this.description,
    required this.timeAgo,
    required this.urlImage,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}