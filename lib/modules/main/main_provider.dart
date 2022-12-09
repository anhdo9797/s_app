import 'dart:async';

import 'package:s_app/data/local/pref.dart';
import 'package:s_app/data/repositories/db_repository.dart';
import 'package:s_app/modules/base/base.dart';

class MainProvider extends BaseViewModel {
  final dbRepository = DBRepository();
  @override
  FutureOr<void> init() {
    checkDB();
  }

  checkDB() {
    if (!AppPref.isInitDb) {}
  }
}
