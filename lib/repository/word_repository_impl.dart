import '../database/word_db_helper.dart';
import '../model/word.dart';

class WordRepositoryImpl {
  late final WordDbHelper db;

  Future<Word?> getWords(int id) async{
    return await db.getWordById(id);
  }

  Future<List<Word>> getWordById(int id) async{
    return await db.getWords();
  }

}