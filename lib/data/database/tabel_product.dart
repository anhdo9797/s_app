import 'dart:developer';

import 'package:s_app/data/database/base_provider.dart';
import 'package:sqflite/sqlite_api.dart';

import '../models/product_model.dart';

class TableProducts extends BaseDBProvider<ProductModel> {
  final Database? db;
  TableProducts(this.db);

  static onCreate(Database db) => db.execute(
        '''
    CREATE TABLE IF NOT EXISTS PRODUCTS
      (${ProductModel.colId} integer primary key autoincrement,
      ${ProductModel.colEarnCode} int,
      ${ProductModel.colName} text,
      ${ProductModel.colImage} text
      )
    ''',
      );

  @override
  Future insert(ProductModel model) async {
    final inserter = await db!.insert("PRODUCTS", model.toMap());
    log("Insert table product $inserter", name: "DATABASE");
  }
}
