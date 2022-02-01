class AdminBooksModel {
  List<AdminBooksDetails>? books;
  int? count;

  AdminBooksModel({this.books, this.count});

  AdminBooksModel.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = <AdminBooksDetails>[];
      json['books'].forEach((v) {
        books!.add(new AdminBooksDetails.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class AdminBooksDetails {
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

  AdminBooksDetails(
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

  AdminBooksDetails.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    print('AdminCoverBook is ${cover}');
    pdf = json['pdf'];
    print('AdminPdfBook is ${pdf}');
    sId = json['_id'];
    print('AdminsIdBook is ${sId}');
    name = json['name'];
    print('AdminNameBook is ${name}');
    category = json['category'];
    print('AdminCategoryBook is ${category}');
    description = json['description'];
    print('AdminDescriptionBook is ${description}');
    user = json['user'];
    print('AdminUserBook is ${user}');
    createdAt = json['createdAt'];
    print('AdminCreatedAtBook is ${createdAt}');
    updatedAt = json['updatedAt'];
    print('AdminUpdatedAtBook is ${updatedAt}');
    iV = json['__v'];
    print('AdminIVBook is ${iV}');
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