import 'package:dream_comes_true/models/post.dart';
import 'package:flutter/material.dart';
import 'package:dream_comes_true/viewmodels/new_post_viewmodel.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  late NewPostViewModel viewModel;
  Uint8List? imageBytes;
  TextEditingController wishController = TextEditingController();
  TextEditingController memberNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = NewPostViewModel();
  }

  Future<void> pickImage() async {
    try {
      Uint8List? pickedImageBytes = await ImagePickerWeb.getImageAsBytes();
      if (pickedImageBytes != null) {
        setState(() {
          imageBytes = pickedImageBytes;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("新しい投稿")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickImage,
              child: Text('画像を選択'),
            ),
            if (imageBytes != null)
              Image.memory(imageBytes!, width: 100, height: 100), // 画像のプレビュー
            TextField(
              controller: wishController,
              decoration: InputDecoration(labelText: '願い事'),
            ),
            TextField(
              controller: memberNameController,
              decoration: InputDecoration(labelText: '名前'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (imageBytes != null &&
              wishController.text.isNotEmpty &&
              memberNameController.text.isNotEmpty) {
            var metadata = SettableMetadata(
              contentType: "image/jpeg",
            );
            var uploadTask = FirebaseStorage.instance
                .ref('posts_images/${DateTime.now().toIso8601String()}')
                .putData(imageBytes!, metadata);
            var snapshot = await uploadTask.whenComplete(() {});
            var imageUrl = await snapshot.ref.getDownloadURL();

            Post post = Post(
              originalImageUrl: imageUrl,
              wish: wishController.text,
              memberName: memberNameController.text,
              postedDate: DateTime.now(),
              generatedImageUrl: '', // 仮
            );

            await viewModel.uploadPost(post);
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('全てのフィールドを入力してください')),
            );
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
