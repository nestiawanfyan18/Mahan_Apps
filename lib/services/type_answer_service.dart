import 'dart:convert';
import 'package:delit_app/Models/type_answer_pwb.dart';
import 'package:delit_app/Models/type_question_models.dart';
import 'package:http/http.dart' as http;

class TypeAnswerService {
  String baseUrl = 'https://mahan-dashoard.herokuapp.com/api';

  get datas => null;

  Future<List<TypeAnswerPWBModel>?> getTypeAnswer({
    required int user_id,
  }) async {
    var headers = {'content-type': 'application/json'};
    var response = await http.get(
      Uri.parse('$baseUrl/getTypeAnswer?user_id=${user_id}'),
      headers: headers,
    );

    print(
        "Response get data Type Answer : ${jsonDecode(response.body)['data']}");

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<TypeAnswerPWBModel> typeAnswer = [];

      for (var item in data) {
        // print("item : " + item.toString());
        typeAnswer.add(TypeAnswerPWBModel.fromJson(item));
      }

      print("datas : ${typeAnswer}");

      return typeAnswer;
    } else {
      throw Exception('Gagal Get Questions PWB');
    }
  }
}
