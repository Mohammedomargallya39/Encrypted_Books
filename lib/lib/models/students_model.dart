class StudentsModel {
  String? image;
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

  StudentsModel(
      {this.image,
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

  StudentsModel.fromJson(Map<String, dynamic> json) {
    image = json['pic'];
    print('studentPic is ${image}');
    isAdmin = json['isAdmin'];
    print('studentAdmin is ${isAdmin}');
    isManagmentsection = json['isManagmentsection'];
    print('studentIsManagmentsection is ${isManagmentsection}');
    isEnginneringsection = json['isEnginneringsection'];
    print('studentIsEnginneringsection is ${isEnginneringsection}');
    isComputerSciencesection = json['isComputerSciencesection'];
    print('studentIsComputerSciencesection is ${isComputerSciencesection}');
    numberofBooks = json['numberofBooks'];
    print('studentNumberOfBooks is ${numberofBooks}');
    sId = json['_id'];
    print('studentsId is ${sId}');
    name = json['name'];
    print('studentName is ${name}');
    email = json['email'];
    print('studentEmail is ${email}');
    phone = json['phone'];
    print('studentPhone is ${phone}');
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    print('studentCreatedAt is ${createdAt}');
    updatedAt = json['updatedAt'];
    print('studentUpdatedAt is ${updatedAt}');
    iV = json['__v'];
    print('studentIV is ${iV}');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.image;
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
  String? sId;
  StudentBookId? bookId;

  Books({this.sId, this.bookId});

  Books.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    print('studentsId is ${sId}');
    bookId =
    json['bookId'] != null ? new StudentBookId.fromJson(json['bookId']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.bookId != null) {
      data['bookId'] = this.bookId!.toJson();
    }
    return data;
  }
}

class StudentBookId {
  String? cover;
  String? pdf;
  String? sId;
  String? name;
  String? category;
  String? description;

  StudentBookId(
      {this.cover,
        this.pdf,
        this.sId,
        this.name,
        this.category,
        this.description});

  StudentBookId.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    print('studentBookCover is ${cover}');
    pdf = json['pdf'];
    print('studentBookPdf is ${pdf}');
    sId = json['_id'];
    print('studentBooksId is ${sId}');
    name = json['name'];
    print('studentBookName is ${name}');
    category = json['category'];
    print('studentBookCategory is ${category}');
    description = json['description'];
    print('studentBookDescription is ${description}');
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