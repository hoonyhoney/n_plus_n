class Word{
   final int id;
   final String noun;

  Word({required this.id, required this.noun});

  Word.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    noun = json['noun'];

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'noun':noun,
      };
}