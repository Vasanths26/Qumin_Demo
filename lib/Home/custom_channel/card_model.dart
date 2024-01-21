// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class CardModel {
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
  // Null restaurantId;
  String? minPrice;
  // Null iconUrl;

  CardModel({
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
    // this.restaurantId,
    this.minPrice,
    // this.iconUrl
  });

  CardModel.fromJson(Map<String, dynamic> json) {
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
    // restaurantId = json['restaurant_id'];
    minPrice = json['min_price'];
    // iconUrl = json['icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['header_text'] = this.headerText;
    data['body_hero_text'] = this.bodyHeroText;
    data['body_description'] = this.bodyDescription;
    data['query_attribute'] = this.queryAttribute;
    data['channel_description'] = this.channelDescription;
    data['is_new'] = this.isNew;
    data['type'] = this.type;
    // data['restaurant_id'] = this.restaurantId;
    data['min_price'] = this.minPrice;
    // data['icon_url'] = this.iconUrl;
    return data;
  }
}
