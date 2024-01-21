class FeedApI {
  final String name;
  final String iconUrl;

  FeedApI({
    required this.name,
    required this.iconUrl,
  });

  factory FeedApI.fromJson(Map<String, dynamic> json) {
    return FeedApI(
      name: json['name'],
      iconUrl: json['icon_url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'icon_url': iconUrl,
      };
}
