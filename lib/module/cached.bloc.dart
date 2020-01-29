import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Cache {
  Database database;

  Completer<Database> _completer;

  Cache();

  /// Get the opened database
  Future<Database> getDatabase() async {
    if (_completer == null) {
      _completer = Completer();
      _openDatabase();
    }
    return _completer.future;
  }

  Future<Database> _openDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, "sample.db");
    var file = new File(dbPath);
    file.createSync();

    database = await databaseFactoryIo.openDatabase(dbPath);
    _completer.complete(database);
    print("init db");
    return database;
  }
}
