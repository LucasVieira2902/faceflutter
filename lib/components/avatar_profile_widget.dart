import 'package:cached_network_image/cached_network_image.dart';
import 'package:faceflutter/utils/paleta_cores.dart';
import 'package:flutter/material.dart';

class AvatarProfileWidget extends StatelessWidget {

  final String urlImage;
  final bool isVisualized;

  const AvatarProfileWidget({Key? key, required this.urlImage, this.isVisualized = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: PaletaCores.azulFacebook,
      child: CircleAvatar(
        radius: isVisualized ? 22 : 18,
        backgroundImage: CachedNetworkImageProvider(urlImage),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}