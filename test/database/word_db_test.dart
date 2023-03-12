import 'package:flutter_test/flutter_test.dart';
import 'package:n_plus_n/database/word_db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('db test',() async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await db.execute('CREATE TABLE word (id INTEGER PRIMARY KEY AUTOINCREMENT, noun TEXT)');

    final wordDbHelper = WordDbHelper(db);

    expect((await wordDbHelper.getWords()).length,0);

    await db.close();
  });
}