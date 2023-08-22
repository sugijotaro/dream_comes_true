class Post {
  final String memberId;
  final String wish;
  final String originalImageUrl;
  final String fulfilledImageUrl;
  final DateTime postedDate;

  Post({
    required this.memberId,
    required this.wish,
    required this.originalImageUrl,
    required this.fulfilledImageUrl,
    required this.postedDate,
  });
}
