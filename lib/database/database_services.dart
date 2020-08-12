import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../class_model.dart';

class DatabaseService {
  static const TABLE_CLASSES = 'classes';
  static const COLUMN_ID = 'id';
  static const COLUMN_USER_ID = 'user_id';
  static const COLUMN_SUBJECT = 'subject';
  static const COLUMN_NAME = 'name';
  static const COLUMN_BIO = 'bio';
  static const COLUMN_WHATSAPP = 'whatsapp';
  static const COLUMN_AVATAR = 'avatar';
  static const COLUMN_COST = 'cost';

  DatabaseService._();

  static final DatabaseService db = DatabaseService._();

  Database _database;

  List<TeacherClass> favoriteClassesList = List();

  Future<Database> get database async {

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(join(dbPath, "ClassesDB.db"), version: 1,
        onCreate: (Database database, int version) async {

      await database.execute('''CREATE TABLE $TABLE_CLASSES (
          $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_NAME TEXT, $COLUMN_SUBJECT TEXT, $COLUMN_AVATAR TEXT,
          $COLUMN_BIO TEXT, $COLUMN_COST NUMBER, $COLUMN_WHATSAPP TEXT, $COLUMN_USER_ID INTEGER)''');

    });
  }

  Future<List<TeacherClass>> getFavoritesTeacherClasses() async {
    final db = await database;

    var favoriteClasses = await db.query(TABLE_CLASSES, columns: [
      COLUMN_ID,
      COLUMN_NAME,
      COLUMN_WHATSAPP,
      COLUMN_BIO,
      COLUMN_AVATAR,
      COLUMN_SUBJECT,
      COLUMN_USER_ID,
      COLUMN_COST
    ]);

    List<TeacherClass> favoriteList =
        favoriteClasses.map((e) => TeacherClass.fromMap(e)).toList();
    favoriteClassesList = favoriteList;
    return favoriteList;
  }

  void insert(TeacherClass newFavoriteClass) async {
    final db = await database;
    db.insert(TABLE_CLASSES, newFavoriteClass.toMap());
  }

  Future<void> handleFavoriteTap(TeacherClass teacherClass) async {

    bool isFavorite = await verifyFavoriteList(teacherClass.userId);

    if (isFavorite) {
      removeFromFavorites(teacherClass.userId);
    } else {
      insert(teacherClass);
    }
  }

  Future<bool> verifyFavoriteList(int userId) async {
    var db = await database;

    List<int> listId = (await db.rawQuery(
    'SELECT * FROM $TABLE_CLASSES WHERE $COLUMN_USER_ID=?',
        [userId]))
    .cast<int>();

    if(listId.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> removeFromFavorites(int userId) async {
    var db = await database;
    await db.delete(TABLE_CLASSES, where: "$COLUMN_USER_ID = $userId");
    favoriteClassesList.removeAt(
      favoriteClassesList.indexWhere((element) => element.userId == userId),
    );
  }

  Future<List<int>> getIdsList() async {
    var db = await database;
    var idList= await db.query(TABLE_CLASSES, columns: [COLUMN_USER_ID]);
    return List<int>.from(idList.map((e) => e["user_id"]));
  }
}
