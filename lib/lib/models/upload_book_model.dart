class UploadBookModel {
  String? cover;
  String? pdf;
  String? sId;
  String? name;
  String? category;
  String? description;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UploadBookModel(
      {this.cover,
        this.pdf,
        this.sId,
        this.name,
        this.category,
        this.description,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UploadBookModel.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    pdf = json['pdf'];
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
    description = json['description'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['pdf'] = this.pdf;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['category'] = this.category;
    data['description'] = this.description;
    data['user'] = this.user;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}