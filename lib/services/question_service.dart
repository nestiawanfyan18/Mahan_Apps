import 'dart:convert';
import 'package:delit_app/Models/questions_models.dart';
import 'package:http/http.dart' as http;

class QuestionService {
  String baseUrl = 'https://mahan-dashoard.herokuapp.com/api';

  Future<List<QuestionsModels>?> getQuestionPWB() async {
    var headers = {'content-type': 'application/json'};
    var response = await http.get(
      Uri.parse('$baseUrl/question?library_id=1801'),
      headers: headers,
    );

    print(response.body);
    print("Status Kode : ${response.statusCode}");

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<QuestionsModels> questions = [];

      for (var item in data) {
        questions.add(QuestionsModels.fromJson(item));
      }

      print("datas : ${questions}");

      return questions;
    } else {
      throw Exception('Gagal Get Questions PWB');
    }
  }
}
