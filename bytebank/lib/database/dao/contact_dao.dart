import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao extends AppDatabase{

  final String tableName = 'contacts';
  final String tableSql = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'name TEXT, '
      'account_number INTEGER)';
  final String dbName = 'bytebank';

  Future<int> save(Contact contact) async {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    final Database db = await getDatabase();
    return db.insert(tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Contact> contacts = List();
    final List<Map<String, dynamic>> result = await db.query(tableName);
    _toList(result, contacts);
    return contacts;
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  void _toList(List<Map<String, dynamic>> result, List<Contact> contacts) {
    for (Map<String, dynamic> row in result) {
      final Contact contact =
      Contact(row['id'], row['name'], row['account_number']);
      contacts.add(contact);
    }
  }

}