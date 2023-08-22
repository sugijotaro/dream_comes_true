import 'package:flutter/material.dart';
import 'package:dream_comes_true/models/post.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;

  PostDetailsPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("投稿の詳細")),
      body: Column(
        children: [
          Image.network(post.originalImageUrl),
          Text(post.wish),
          Text(post.memberId),
        ],
      ),
    );
  }
}
