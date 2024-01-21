// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class PopularModel {
  String? curationName;
  String? curationType;
  String? description;
  String? iconUrl;
  String? imageUrl;
  String? targetElementId;
  // Null restaurantId;
  String? curationId;

  PopularModel(
      {this.curationName,
      this.curationType,
      this.description,
      this.iconUrl,
      this.imageUrl,
      this.targetElementId,
      //this.restaurantId,
      this.curationId});

  PopularModel.fromJson(Map<String, dynamic> json) {
    curationName = json['curation_name'];
    curationType = json['curation_type'];
    description = json['description'];
    iconUrl = json['icon_url'];
    imageUrl = json['image_url'];
    targetElementId = json['target_element_id'];
    //restaurantId = json['restaurant_id'];
    curationId = json['curation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curation_name'] = this.curationName;
    data['curation_type'] = this.curationType;
    data['description'] = this.description;
    data['icon_url'] = this.iconUrl;
    data['image_url'] = this.imageUrl;
    data['target_element_id'] = this.targetElementId;
    //data['restaurant_id'] = this.restaurantId;
    data['curation_id'] = this.curationId;
    return data;
  }
}
