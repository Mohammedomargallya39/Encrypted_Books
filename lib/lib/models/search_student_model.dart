class SearchStudentModel {
  String? pic;
  bool? isAdmin;
  bool? isManagmentsection;
  bool? isEnginneringsection;
  bool? isComputerSciencesection;
  List<SearchStudentBookModel>? books;
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SearchStudentModel(
      {this.pic,
        this.isAdmin,
        this.isManagmentsection,
        this.isEnginneringsection,
        this.isComputerSciencesection,
        this.books,
        this.sId,
        this.name,
        this.email,
        this.phone,
        this.createdAt,
        this.updatedAt,
        this.iV});

  SearchStudentModel.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    isAdmin = json['isAdmin'];
    isManagmentsection = json['isManagmentsection'];
    isEnginneringsection = json['isEnginneringsection'];
    isComputerSciencesection = json['isComputerSciencesection'];
    if (json['books'] != null) {
      books = <SearchStudentBookModel>[];
      json['books'].forEach((v) {
        books!.add(new SearchStudentBookModel.fromJson(v));
      });
    }
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['isAdmin'] = this.isAdmin;
    data['isManagmentsection'] = this.isManagmentsection;
    data['isEnginneringsection'] = this.isEnginneringsection;
    data['isComputerSciencesection'] = this.isComputerSciencesection;
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class SearchStudentBookModel {
  String? cover;
  String? pdf;
  String? sId;
  String? name;
  String? category;
  String? description;

  SearchStudentBookModel(
      {this.cover,
        this.pdf,
        this.sId,
        this.name,
        this.category,
        this.description});

  SearchStudentBookModel.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    pdf = json['pdf'];
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['pdf'] = this.pdf;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['category'] = this.category;
    data['description'] = this.description;
    return data;
  }
}