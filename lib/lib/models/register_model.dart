class UserRegisterModel
{
  UserDepartment? department;

  UserRegisterModel.fromJson(Map<dynamic, dynamic> json) {
    department = json['data'] != null ? UserDepartment.fromJson(json['data']) : null;
  }
}

class UserDepartment
{
  late bool isEng;
  late bool isMan;
  late bool isCom;

  UserDepartment.fromJson(Map<String, dynamic> json) {
    isMan = json["isManagmentsection"] ?? false;
    print('is manage done');

    isEng = json["isEnginneringsection"] ?? false;
    print('is eng  done');

    isCom = json["isComputerSciencesection"] ?? false;
    print('is computer  done');

  }

}

