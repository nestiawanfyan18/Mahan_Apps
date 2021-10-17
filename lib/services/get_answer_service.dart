import 'dart:convert';

import 'package:delit_app/Models/get_answer_questions_models.dart';
import 'package:http/http.dart' as http;

class GetAnswerService {
  String baseUrl = 'https://mahan-dashoard.herokuapp.com/api';

  Future<GetAnswerQuestionModels> getDataAnswerUsers({
    required String user_id,
  }) async {
    var headers = {'content-type': 'application/json'};
    var body = jsonEncode({
      'user_id': user_id,
    });

    // print("Data Answer User PWB - 33 : ${user_id}");

    var response = await http.post(
      Uri.parse('$baseUrl/getanswer'),
      headers: headers,
      body: body,
    );

    print("Data Answer User PWB - response : ${response.body}");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      GetAnswerQuestionModels answerPWB =
          GetAnswerQuestionModels.fromJson(data);

      print("Data Answer User PWB - 2 : ${jsonEncode(data)}");

      return answerPWB;
    } else {
      throw Exception('Gagal Perbaharui Data Answer PWB');
    }
  }
}
