class Channel {
  String? name;
  String? id;
  String? imageUrl;
  String? createdAt;
  String? headerText;
  String? bodyHeroText;
  String? bodyDescription;
  String? queryAttribute;
  String? channelDescription;
  bool? isNew;
  String? type;
  String? minPrice;

  Channel({
    this.name,
    this.id,
    this.imageUrl,
    this.createdAt,
    this.headerText,
    this.bodyHeroText,
    this.bodyDescription,
    this.queryAttribute,
    this.channelDescription,
    this.isNew,
    this.type,
    this.minPrice,
  });

  Channel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    headerText = json['header_text'];
    bodyHeroText = json['body_hero_text'];
    bodyDescription = json['body_description'];
    queryAttribute = json['query_attribute'];
    channelDescription = json['channel_description'];
    isNew = json['is_new'];
    type = json['type'];
    minPrice = json['min_price'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'image_url': imageUrl,
        'created_at': createdAt,
        'header_text': headerText,
        'body_hero_text': bodyHeroText,
        'body_description': bodyDescription,
        'query_attribute': queryAttribute,
        'channel_description': channelDescription,
        'is_new': isNew,
        'type': type,
        'min_price': minPrice,
      };
}
