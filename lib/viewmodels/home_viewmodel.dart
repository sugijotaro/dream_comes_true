import 'package:dream_comes_true/models/post.dart';
import 'package:dream_comes_true/services/firebase_service.dart';

class HomeViewModel {
  final FirebaseService _firebaseService = FirebaseService();

  List<Post> get posts => _firebaseService.getPosts(); // 仮の実装です
}
