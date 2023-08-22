import 'package:flutter/material.dart';
import 'package:dream_comes_true/viewmodels/home_viewmodel.dart';
import 'package:dream_comes_true/widgets/post_list_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelを使ってデータを取得
    // (ProviderやRiverpodを使ってインスタンス化・取得)
    final viewModel = HomeViewModel();

    return Scaffold(
      appBar: AppBar(title: Text("夢を叶えるアプリ")),
      body: ListView.builder(
        itemCount: viewModel.posts.length,
        itemBuilder: (context, index) {
          final post = viewModel.posts[index];
          return PostListItem(post: post);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 新しい投稿画面へ遷移
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
