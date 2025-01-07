class DictionaryModel {
  final String word;
  final String? phonetic;
  final List<Phonetic> phonetics;
  final String origin;
  final List<Meaning> meanings;

  DictionaryModel({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.origin,
    required this.meanings,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    return DictionaryModel(
      word: json['word'],
      phonetic: json['phonetic'] ?? '',
      phonetics: (json['phonetics'] as List)
          .map((e) => Phonetic.fromJson(e))
          .toList(),
      origin: json['origin'] ?? '',
      meanings: (json['meanings'] as List)
          .map((e) => Meaning.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics.map((e) => e.toJson()).toList(),
      'origin': origin,
      'meanings': meanings.map((e) => e.toJson()).toList(),
    };
  }
}

class Phonetic {
  final String? text;
  final String? audio;

  Phonetic({
    required this.text,
    this.audio,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) {
    return Phonetic(
      text: json['text'],
      audio: json['audio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'audio': audio,
    };
  }
}

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      partOfSpeech: json['partOfSpeech'],
      definitions: (json['definitions'] as List)
          .map((e) => Definition.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partOfSpeech': partOfSpeech,
      'definitions': definitions.map((e) => e.toJson()).toList(),
    };
  }
}

class Definition {
  final String definition;
  final String? example;
  final List<String> synonyms;
  final List<String> antonyms;

  Definition({
    required this.definition,
    this.example,
    required this.synonyms,
    required this.antonyms,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json['definition'],
      example: json['example'],
      synonyms: List<String>.from(json['synonyms'] ?? []),
      antonyms: List<String>.from(json['antonyms'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'definition': definition,
      'example': example,
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }
}
