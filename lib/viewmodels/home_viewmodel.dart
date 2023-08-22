import 'package:dream_comes_true/models/post.dart';
import 'package:dream_comes_true/services/firebase_service.dart';

class HomeViewModel {
  final FirebaseService _firebaseService = FirebaseService();

  Future<List<Post>> getPosts() async {
    return await _firebaseService.getPosts();
  }
}
