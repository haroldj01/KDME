class Word {

  final String topic;
  final String english;
  final String kadazan;

  Word(
      {required this.topic,
        required this.english,
        required this.kadazan});

  Map<String, dynamic> toMap(){
    return {
      'topic' : topic,
      'english' : english,
      'kadazan' : kadazan
    };
  }

  factory Word.fromMap({required Map<String, dynamic> map}){
    return Word(
        topic: map['topic'],
        english: map['english'],
        kadazan: map['kadazan']);
  }

}