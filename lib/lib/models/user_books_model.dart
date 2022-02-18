// class HomeModel
// {
//   late String image;
//   late bool isAdmin;
//   late bool isMan;
//   late bool isEng;
//   late bool isCom;
//   late int NumOfBooks;
//   late String id;
//   late String name;
//   late String email;
//   late String phone;
//   late String createdIn;
//   late String updatedIn;
//   late List<HomeBooksModel> books = [];
//   HomeModel.fromJson(Map<String,dynamic> json)
//   {
//     image = json['pic'] ??'' ;
//     isAdmin = json['isAdmin']?? false ;
//     isMan = json['isManagmentsection'] ?? false;
//     isEng = json['isEnginneringsection'] ?? false;
//     isCom = json['isComputerSciencesection'] ?? false;
//     NumOfBooks = json['numberofBooks'] ?? 0;
//     id = json['_id'] ??'';
//     name = json['name'] ??'';
//     email = json['email'] ??'';
//     phone = json['phone'] ??'';
//     createdIn = json['createdAt'] ??'';
//     updatedIn = json['updatedAt'] ??'';
//     json['books'].forEach((element)
//     {
//       books. add(element);
//     });
//   }
// }
// class HomeBooksModel
// {
//   late String id;
//   late BooksInfoModel bookInfo;
//   HomeBooksModel.fromJson(Map<String,dynamic> json)
//   {
//     id = json['_id'] ??'';
//     bookInfo = BooksInfoModel.fromJson(json['bookId']);
//   }
// }
// class BooksInfoModel
// {
//   late String cover;
//   late String pdf;
//   late String id;
//   late String name;
//   late String category;
//   late String description;
//   BooksInfoModel.fromJson(Map<String,dynamic> json)
//   {
//     cover = json['cover'] ??'';
//     pdf = json['pdf'] ??'';
//     id = json['_id'] ??'';
//     name = json['name'] ??'';
//     category = json['category'] ??'';
//     description = json['description'] ??'';
//
//   }
// }

class HomeModel {
  String? pic;
  bool? isAdmin;
  bool? isManagmentsection;
  bool? isEnginneringsection;
  bool? isComputerSciencesection;
  int? numberofBooks;
  String? sId;
  String? name;
  String? email;
  String? phone;
  List<Books>? books;
  String? createdAt;
  String? updatedAt;
  int? iV;

  HomeModel(
      {this.pic,
        this.isAdmin,
        this.isManagmentsection,
        this.isEnginneringsection,
        this.isComputerSciencesection,
        this.numberofBooks,
        this.sId,
        this.name,
        this.email,
        this.phone,
        this.books,
        this.createdAt,
        this.updatedAt,
        this.iV});

  HomeModel.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    print(pic);
    isAdmin = json['isAdmin'];
    print(isAdmin);
    isManagmentsection = json['isManagmentsection'];
    print(isManagmentsection);
    isEnginneringsection = json['isEnginneringsection'];
    print(isEnginneringsection);
    isComputerSciencesection = json['isComputerSciencesection'];
    print(isComputerSciencesection);
    numberofBooks = json['numberofBooks'];
    print(numberofBooks);
    sId = json['_id'];
    print(sId);
    name = json['name'];
    print(name);
    email = json['email'];
    print(email);
    phone = json['phone'];
    print(phone);
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    print(createdAt);
    updatedAt = json['updatedAt'];
    print(updatedAt);
    iV = json['__v'];
    print(iV);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['isAdmin'] = this.isAdmin;
    data['isManagmentsection'] = this.isManagmentsection;
    data['isEnginneringsection'] = this.isEnginneringsection;
    data['isComputerSciencesection'] = this.isComputerSciencesection;
    data['numberofBooks'] = this.numberofBooks;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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

  Books(
      {this.cover,
        this.pdf,
        this.sId,
        this.name,
        this.category,
        this.description});

  Books.fromJson(Map<String, dynamic> json) {
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