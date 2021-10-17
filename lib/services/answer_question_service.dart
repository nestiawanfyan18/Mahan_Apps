import 'dart:convert';

import 'package:delit_app/Models/answer_question.dart';
import 'package:delit_app/Models/get_answer_questions_models.dart';
import 'package:delit_app/Models/user_models.dart';
import 'package:delit_app/providers/auth_provider.dart';
import 'package:delit_app/services/auth_service.dart';
import 'package:http/http.dart' as http;

class AnswerQuestionService {
  String baseUrl = 'https://mahan-dashoard.herokuapp.com/api';

  Future<AnswerQuestionModels> answerQuestion({
    required double point_answer,
    required int user_id,
    required int jenisPertanyaan,
  }) async {
    var headers = {'content-type': 'application/json'};
    var body = jsonEncode({
      'point_answer': point_answer,
      'user_id': user_id,
      'jenis_pertanyaan_id': jenisPertanyaan,
    });

    var response = await http.post(Uri.parse('$baseUrl/answer'),
        headers: headers, body: body);

    print("respon body answer : ${jsonDecode(response.body)['data']}");

    if (response.statusCode == 200) {
      var dataAnswer = jsonDecode(response.body)['data']['answer'];
      var dataUser = jsonDecode(response.body)['data']['user'];
      AnswerQuestionModels answer = AnswerQuestionModels.fromJson(dataAnswer);

      UserModels().test_psikologi = '1';

      print("User Mode Test Psikologi : ${UserModels().test_psikologi}");

      return answer;
    } else {
      throw Exception('Gagal Jawab');
    }
  }
}
