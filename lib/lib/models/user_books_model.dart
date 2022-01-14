class HomeModel
{
  String? image;
  String? isAdmin;
  String? isMan;
  String? isEng;
  String? isCom;
  int? NumOfBooks;
  String? id;
  String? name;
  String? email;
  String? phone;
  String? createdIn;
  String? updatedIn;
  List<HomeBooksModel>? books = [];

  HomeModel.fromJson(Map<String,dynamic> json)
  {
    image = json['pic'] ;
    isAdmin = json['isAdmin'] ;
    isMan = json['isManagmentsection'] ;
    isEng = json['isEnginneringsection'] ;
    isCom = json['isComputerSciencesection'] ;
    NumOfBooks = json['numberofBooks'] ;
    id = json['_id'] ;
    name = json['name'] ;
    email = json['email'] ;
    phone = json['phone'] ;
    createdIn = json['createdAt'] ;
    updatedIn = json['updatedAt'] ;
    json['books'].forEach((element)
    {
      books!. add(element);
    });
  }
}

class HomeBooksModel
{
  String? id;
  BooksInfoModel? bookInfo;
  HomeBooksModel.fromJson(Map<String,dynamic> json)
  {
    id = json['_id'];
    bookInfo = BooksInfoModel.fromJson(json['bookId']);
  }


}

class BooksInfoModel
{
  String? cover;
  String? pdf;
  String? id;
  String? name;
  String? category;
  String? description;
  BooksInfoModel.fromJson(Map<String,dynamic> json)
  {
    cover = json['cover'];
    pdf = json['pdf'];
    id = json['_id'];
    name = json['name'];
    category = json['category'];
    description = json['description'];

  }

}