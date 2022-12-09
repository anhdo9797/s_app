import 'package:dio/dio.dart';
import 'package:s_app/data/database/db_provider.dart';
import 'package:s_app/share/services/user_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../data/database/tabel_product.dart';
import 'dio_client.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  ///
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(UserManager());

  /// database
  getIt.registerSingletonAsync<Database>(() => DBProvider.initDB());
  getIt.registerSingleton(() => TableProducts(DBProvider.db.database));
}
