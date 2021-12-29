class WallModel {
  final String title;
  final String category;
  final String author;
  final String url;
  final String thumbnailUrl;

  const WallModel({required this.title, required this.category, required this.author, required this.url, required this.thumbnailUrl});

  factory WallModel.fromJson(Map<String, dynamic> json) {
    return WallModel(
      title: json['title'],
      category: json['category'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
      author: json['author'],
    );
  }
}