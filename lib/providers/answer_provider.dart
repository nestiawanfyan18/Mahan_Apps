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
  }) async {
    try {
      // print("Data Answer Provider: ${answer}");

      for (var i = 0; i < answer.length; i++) {
        point_answer += answer[i];
      }

      print("Result Answer Point : ${point_answer}");

      AnswerQuestionModels answerQuestion =
          await AnswerQuestionService().answerQuestion(
        point_answer: point_answer,
        user_id: user_id,
        jenisPertanyaan: jenisPertanyaan,
      );

      _answerQuestion = answerQuestion;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
