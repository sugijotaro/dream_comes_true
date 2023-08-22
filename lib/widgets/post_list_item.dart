import 'package:flutter/material.dart';
import 'package:dream_comes_true/models/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;

  PostListItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(post.originalImageUrl),
      title: Text(post.wish),
      subtitle: Text(post.memberName),
      trailing: Image.network(post.generatedImageUrl ?? ''),
    );
  }
}
