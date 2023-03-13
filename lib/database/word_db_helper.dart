import 'package:sqflite/sqflite.dart';

import '../model/word.dart';

class WordDbHelper {
  late Database db;

  WordDbHelper(this.db);
  Future<Word?> getWordById(int id) async{
    // SELECT * FROM note WHERE id = ?
    final List<Map<String, dynamic>> maps  = await db.query('word',
        where: 'id = ?',
        whereArgs: [id],
    );
    if(maps.isNotEmpty){
      return Word.fromJson(maps.first);
    }
    return null;
  }

  Future<List<Word>> getWords() async {
    final maps = await db.query('word');
    return maps.map((e) => Word.fromJson(e)).toList();
  }


}