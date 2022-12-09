import 'package:sqflite/sqlite_api.dart';

class BaseDBProvider<T> {
  static Future onCreate(Database db) async {}
  Future deleted(Database db) async {}
  Future insert(T model) async {}
  Future update(T model) async {}
}
