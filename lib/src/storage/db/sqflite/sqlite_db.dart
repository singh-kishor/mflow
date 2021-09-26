import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'ddl.dart';

class SqliteDB {
  static late final Database database;
  static late final String dbPath;

  static setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    dbPath = join(await getDatabasesPath(), 'mflow.db');

    database = await openDatabase(
      dbPath,
      onCreate: _createDbObjects,
      version: 1,
    );
  }

  static _createDbObjects(Database db, int version) {
    return db.execute(DDL.createExpenseTable);
  }

  static purge() async{
    print('DELETING THE DB $dbPath');
    await deleteDatabase(dbPath);
    print('DELETED THE DB $dbPath successfully');
  }
}
