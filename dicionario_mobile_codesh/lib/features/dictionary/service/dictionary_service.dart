import 'dart:convert';
import 'package:dicionario_mobile_codesh/features/dictionary/model/dictionary_model.dart';
import 'package:http/http.dart' as http;

class DictionaryService {
 Future<DictionaryModel?> searchWord(String word) async {
    String url = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          return DictionaryModel.fromJson(data[0]);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
