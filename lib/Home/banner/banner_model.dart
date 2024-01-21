// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class Banners {
  String? imageUrl;
  bool? isClickable;
  int? sortSequence;
  String? targetElement;
  String? targetElementId;
  String? id;

  Banners({
    this.imageUrl,
    this.isClickable,
    this.sortSequence,
    this.targetElement,
    this.targetElementId,
    this.id,
  });

  Banners.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    isClickable = json['is_clickable'];
    sortSequence = json['sort_sequence'];
    targetElement = json['target_element'];
    targetElementId = json['target_element_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
        'is_clickable': isClickable,
        'sort_sequence': sortSequence,
        'target_element': targetElement,
        'target_element_id': targetElementId,
        'id': id,
      };
}
