import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_comes_true/models/post.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Post>> getPosts() async {
    QuerySnapshot snapshot = await _firestore.collection('posts').get();

    return snapshot.docs.map((doc) {
      return Post(
        memberName: doc['memberName'],
        wish: doc['wish'],
        originalImageUrl: doc['originalImageUrl'],
        generatedImageUrl: doc['generatedImageUrl'],
        postedDate: (doc['postedDate'] as Timestamp).toDate(),
      );
    }).toList();
  }

  // その他、投稿の保存や更新などのメソッドを追加
}
