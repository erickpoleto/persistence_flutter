import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {

  String tableName;
  String tableSql;
  String dbName;

  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), '$dbName.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(tableSql);
      },
      version: 1,
    );
  }


}
