class Post {
  final String memberName;
  final String wish;
  final String originalImageUrl;
  final String generatedImageURL;
  final DateTime postedDate;

  Post({
    required this.memberName,
    required this.wish,
    required this.originalImageUrl,
    required this.generatedImageURL,
    required this.postedDate,
  });
}
