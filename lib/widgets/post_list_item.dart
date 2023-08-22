import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dream_comes_true/models/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;

  PostListItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.network(post.originalImageUrl, fit: BoxFit.cover),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: (post.generatedImageUrl != null &&
                        post.generatedImageUrl!.isNotEmpty)
                    ? Image.network(post.generatedImageUrl!, fit: BoxFit.cover)
                    : _buildBlurredImage(post.originalImageUrl),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            alignment: Alignment.center,
            child: Text(post.wish, textAlign: TextAlign.center),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(post.memberName, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget _buildBlurredImage(String imageUrl) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Image.network(imageUrl,
            fit: BoxFit.cover,
            color: Colors.white.withOpacity(0.9),
            colorBlendMode: BlendMode.dstOut),
      ),
    );
  }
}
