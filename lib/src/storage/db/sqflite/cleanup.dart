import 'package:mflow/src/storage/db/sqflite/sqlite_db.dart';

Future<void> main() async {
  print('object');
  await SqliteDB.setup();
  await SqliteDB.purge();
}