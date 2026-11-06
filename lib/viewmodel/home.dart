class BannerItem {
  final int id;
  final String imageUrl;
  BannerItem({required this.id, required this.imageUrl});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'], imageUrl: json['thumbnail']);
  }
}

class CatogoryItem {
  final String slug;
  final String name;
  final String url;

  CatogoryItem({
    required this.slug,
    required this.name,
    required this.url,
  });

  factory CatogoryItem.fromJson(Map<String, dynamic> json) {
    return CatogoryItem(
      slug: json['slug'],
      name: json['name'],
      url: json['url'],
    );
  }
}