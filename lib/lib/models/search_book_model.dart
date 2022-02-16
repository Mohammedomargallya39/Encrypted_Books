class SearchBookModel {
  List<Books>? books;

  SearchBookModel({this.books});

  SearchBookModel.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
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

  Books(
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

  Books.fromJson(Map<String, dynamic> json) {
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