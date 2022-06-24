import 'package:cached_network_image/cached_network_image.dart';
import 'package:faceflutter/components/post_header.dart';
import 'package:faceflutter/models/post.dart';
import 'package:faceflutter/utils/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PostAreaWidget extends StatelessWidget {

  final Post post;

  const PostAreaWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          //CABECALHO
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeader(post: post),
                Text(post.description)
              ],
            ),
          ),
          
          //POSTAGEM
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(
              imageUrl: post.urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 260,
            ),
          ),

          //AREA DE ESTATISTICAS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: PostStatisticWidget(post: post),
          )
        ]
      )
    );
  }
}

class PostButtonWidget extends StatelessWidget {

  final Icon icon;
  final String text;
  final VoidCallback onTap;

  const PostButtonWidget({Key? key, required this.icon, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Text(text, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          )
        )
      )
    );
  }
}

class PostStatisticWidget extends StatelessWidget {

  final Post post;

  const PostStatisticWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: PaletaCores.azulFacebook,
                shape: BoxShape.circle
              ),
              child: const Icon(Icons.thumb_up, color: Colors.white, size: 10),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text("${post.likes}", style: TextStyle(fontSize: 12, color: Colors.grey[700]))
            ),
            
            const SizedBox(width: 4),
            Text("${post.comments} comentários", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            
            const SizedBox(width: 4),
            Text("${post.shares} compartilhamentos", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
          ]
        ),
        const Divider(thickness: 1.2,),
        Row(
          children: [
            PostButtonWidget(
              icon: Icon(LineIcons.thumbsUpAlt, color: Colors.grey[700]), 
              text: "Curtir", 
              onTap: (){}
            ),
            PostButtonWidget(
              icon: Icon(LineIcons.alternateComment, color: Colors.grey[700]), 
              text: "Comentar", 
              onTap: (){}
            ),
            PostButtonWidget(
              icon: Icon(LineIcons.share, color: Colors.grey[700]), 
              text: "Compartilhar", 
              onTap: (){}
            ),
          ],
        )
      ],
    );
  }
}