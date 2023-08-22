import 'package:flutter/material.dart';
// import 'package:dream_comes_true/viewmodels/new_post_viewmodel.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  // late NewPostViewModel viewModel;
  // ... 画像の選択やテキストフィールドのコントローラーなどのステート管理

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("新しい投稿")),
      body: Column(
        children: [
          // 画像アップロードボタンやテキストフィールドなどのUIコンポーネント
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ここで新しい投稿をFirebaseにアップロードするロジック
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
