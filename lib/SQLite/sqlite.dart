// ignore_for_file: non_constant_identifier_names

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter_crud/JsonModels/note_model.dart';
import 'package:sqlite_flutter_crud/JsonModels/users.dart';

class DatabaseHelper {
  final databaseName = "sms12.db";
  String noteTable =
      "CREATE TABLE notes (noteId INTEGER PRIMARY KEY AUTOINCREMENT, noteTitle TEXT NOT NULL, noteContent TEXT NOT NULL, createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";
  //Now we must create our user table into our sqlite db
  String student =
      "create table Student (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrEmail TEXT UNIQUE, usrPassword TEXT)";
  String teacher =
      "create table Teacher (TusrName TEXT UNIQUE, TusrPassword TEXT)";
  String course =
      "create table Course (courseId INTEGER PRIMARY KEY AUTOINCREMENT, courseTitle TEXT NOT NULL, courseContent TEXT NOT NULL, createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(student);
      await db.execute(teacher);
      await db.execute(noteTable);
      await db.execute(course);
    });
  }
  //Now we create login and sign up method
  //as we create sqlite other functionality in our previous video

  //IF you didn't watch my previous videos, check part 1 and part 2

  //Login Method TEACHER
  Future<bool> loginT(Teacher user) async {
    final Database db = await initDB();

    // I forgot the password to check
    var result = await db.rawQuery(
        "select * from Teacher where TusrName = '${user.TusrName}' AND TusrPassword = '${user.TusrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up teacher
  Future<int> SignUpT(Teacher user) async {
    final Database db = await initDB();
    return db.insert('Teacher', user.toMap());
  }

  //Login Method STUDENT
  Future<bool> login(Student user) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "select * from Student where usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up STUDENT
  Future<int> signup(Student user) async {
    final Database db = await initDB();
    return db.insert('Student', user.toMap());
  }

// get student name
  Future<List<Student>> getStudent() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('Student');
    return result.map((e) => Student.fromMap(e)).toList();
  }

  //Search Method
  Future<List<NoteModel>> searchNotes(String keyword) async {
    final Database db = await initDB();
    List<Map<String, Object?>> searchResult = await db
        .rawQuery("select * from notes where noteTitle LIKE ?", ["%$keyword%"]);
    return searchResult.map((e) => NoteModel.fromMap(e)).toList();
  }

  //CRUD Methods
  // Student NOTES
  //Create Note
  Future<int> createNote(NoteModel note) async {
    final Database db = await initDB();
    return db.insert('notes', note.toMap());
  }

  //Get notes
  Future<List<NoteModel>> getNotes() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('notes');
    return result.map((e) => NoteModel.fromMap(e)).toList();
  }

  //Delete Notes
  Future<int> deleteNote(int id) async {
    final Database db = await initDB();
    return db.delete('notes', where: 'noteId = ?', whereArgs: [id]);
  }

  //Update Notes
  Future<int> updateNote(title, content, noteId) async {
    final Database db = await initDB();
    return db.rawUpdate(
        'update notes set noteTitle = ?, noteContent = ? where noteId = ?',
        [title, content, noteId]);
  }

//COURSES CRUD
  //Create Course
  Future<int> createCourse(CourseModel note) async {
    final Database db = await initDB();
    return db.insert('Course', note.toMap());
  }

  //Get course
  Future<List<CourseModel>> getCourse() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('Course');
    return result.map((e) => CourseModel.fromMap(e)).toList();
  }

  //Delete course
  Future<int> deleteCourse(int id) async {
    final Database db = await initDB();
    return db.delete('Course', where: 'courseId = ?', whereArgs: [id]);
  }

  //Update course
  Future<int> updateCourse(title, content, courseId) async {
    final Database db = await initDB();
    return db.rawUpdate(
        'update course set courseTitle = ?, courseContent = ? where courseId = ?',
        [title, content, courseId]);
  }

  //Search Method
  Future<List<CourseModel>> searchCourse(String keyword) async {
    final Database db = await initDB();
    List<Map<String, Object?>> searchResult = await db.rawQuery(
        "select * from Course where courseTitle LIKE ?", ["%$keyword%"]);
    return searchResult.map((e) => CourseModel.fromMap(e)).toList();
  }
}
