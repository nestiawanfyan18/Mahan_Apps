import 'dart:convert';
import 'package:delit_app/Models/answer_question.dart';
import 'package:delit_app/Models/get_answer_questions_models.dart';
import 'package:delit_app/services/answer_question_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerQuestionProvider with ChangeNotifier {
  late AnswerQuestionModels _answerQuestion;

  AnswerQuestionModels get answerQuestion => _answerQuestion;

  set answerQuestion(AnswerQuestionModels answerQuestion) {
    _answerQuestion = answerQuestion;
    notifyListeners();
  }

  Future<bool> answer({
    required double point_answer,
    required List answer,
    required int user_id,
    required int jenisPertanyaan,
    required List typeAnswer,
  }) async {
    try {
      List pointAnswerType = [0];
      List answer_type = [];
      var soalInt = 4;
      // print("Data Answer Provider: ${answer}");

      for (var i = 0; i < answer.length; i++) {
        var j = 0;
        point_answer += answer[i];

        if (soalInt == i) {
          pointAnswerType.add(point_answer.toInt());
          soalInt += 5;
          j++;
        }
      }
      // print("Jawaban Per-type : " +
      //     (pointAnswerType[i + 1] - pointAnswerType[i]).toString());

      for (var i = 0; i < typeAnswer.length; i++) {
        answer_type.add({
          'user_id': user_id,
          'library_question_id': jenisPertanyaan,
          'type_question_id': typeAnswer[i],
          'point_answer':
              (pointAnswerType[i + 1] - pointAnswerType[i]).toString(),
        });
      }

      print("Result Answer Point : ${answer_type}");

      AnswerQuestionModels answerQuestion =
          await AnswerQuestionService().answerQuestion(
        point_answer: point_answer,
        user_id: user_id,
        jenisPertanyaan: jenisPertanyaan,
        answer_type: answer_type,
      );

      _answerQuestion = answerQuestion;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
