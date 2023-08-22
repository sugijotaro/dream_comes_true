class Post {
  final String memberName;
  final String wish;
  final String originalImageUrl;
  final String generatedImageUrl;
  final DateTime postedDate;

  Post({
    required this.memberName,
    required this.wish,
    required this.originalImageUrl,
    required this.generatedImageUrl,
    required this.postedDate,
  });
}
