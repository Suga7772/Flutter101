//In here first we create the users json model
// To parse this JSON data, do
//

// Teacher class is created
class Teacher {
  final String TusrName;
  final String TusrPassword;

  Teacher({
    required this.TusrName,
    // ignore: non_constant_identifier_names
    required this.TusrPassword,
  });

  factory Teacher.fromMap(Map<String, dynamic> json) => Teacher(
        TusrName: json["TusrName"],
        TusrPassword: json["TusrPassword"],
      );

  Map<String, dynamic> toMap() => {
        "TusrName": TusrName,
        "TusrPassword": TusrPassword,
      };
}

// student class is created
class Student {
  final int? usrId;
  final String usrName;
  final String usrEmail;
  final String usrPassword;

  Student({
    this.usrId,
    required this.usrName,
    required this.usrEmail,
    required this.usrPassword,
  });

  factory Student.fromMap(Map<String, dynamic> json) => Student(
        usrId: json["usrId"],
        usrName: json["usrName"],
        usrEmail: json["usrEmail"],
        usrPassword: json["usrPassword"],
      );

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "usrName": usrName,
        "usrEmail": usrEmail,
        "usrPassword": usrPassword,
      };
}

// Courses for Teachers to Add
class CourseModel {
  // CourseModel class
  final int? courseId;
  final String courseTitle;
  final String courseContent;
  final String createdAt;

  CourseModel({
    this.courseId,
    required this.courseTitle,
    required this.courseContent,
    required this.createdAt,
  });

  factory CourseModel.fromMap(Map<String, dynamic> json) => CourseModel(
        courseId: json["courseId"],
        courseTitle: json["courseTitle"],
        courseContent: json["courseContent"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "courseId": courseId,
        "courseTitle": courseTitle,
        "courseContent": courseContent,
        "createdAt": createdAt,
      };
}
