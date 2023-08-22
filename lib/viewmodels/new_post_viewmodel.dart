import 'package:dream_comes_true/models/post.dart';
import 'package:dream_comes_true/services/firebase_service.dart';

class NewPostViewModel {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> uploadPost(Post post) async {
    await _firebaseService.addPost(post);
  }
}
