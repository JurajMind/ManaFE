import 'dart:io';

import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Cache {
  Database database;
  Future _doneFuture;
  Future get initializationDone => _doneFuture;

  Future _init() async {
    String dbPath = join(dirname(Platform.script.toFilePath()), "sample.db");
    database = await databaseFactoryIo.openDatabase(dbPath);
    print("init db");
  }

  static final Cache _singleton = new Cache._internal();

  factory Cache() {
    return _singleton;
  }

  Cache._internal() {
    _init();
  }
}
