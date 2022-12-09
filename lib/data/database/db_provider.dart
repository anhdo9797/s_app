import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:s_app/data/database/tabel_product.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _database;

  DBProvider() {
    initDB();
  }

  get database => _database;

  static Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "SApp.db");
    final opener = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      log("INIT DB", name: "DATABASE");
      await TableProducts.onCreate(db);
    });

    _database = opener;

    return opener;
  }
}
