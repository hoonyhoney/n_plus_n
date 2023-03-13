import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/word.dart';

void main() async {

  final database = openDatabase(
    join(await getDatabasesPath(),'word_database.db'),
    onCreate: (db,version) {
      return db.execute(
      "CREATE TABLE word(id INTEGER PRIMARY KEY, noun TEXT)",
      );
  },
  version: 1,
  );

  Future<void> insertWord(Word word) async {
    final Database db = await database;
    await db.insert(
      'words',
      word.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Word>> words() async {
    final Database db = await database;
    final List<Map<String,dynamic>> maps = await db.query('words');
    return List.generate(maps.length, (i){
      return Word(
        id: maps[i]['id'],
        noun: maps[i]['noun']
      );
    });
  }

  var hello = Word(
    id:1,
    noun:'안녕',
  );
  await insertWord(hello);
  print(await words());



}