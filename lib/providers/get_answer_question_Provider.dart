import 'dart:convert';

import 'package:delit_app/Models/get_answer_questions_models.dart';
import 'package:delit_app/services/answer_question_service.dart';
import 'package:delit_app/services/get_answer_service.dart';
import 'package:flutter/cupertino.dart';

class GetAnswerQuestionsProvider with ChangeNotifier {
  late GetAnswerQuestionModels _getAnswerQuestions;

  GetAnswerQuestionModels get getAnswerQuestion => _getAnswerQuestions;

  set getAnswerQuestion(GetAnswerQuestionModels getAnswerQuestion) {
    _getAnswerQuestions = getAnswerQuestion;
    notifyListeners();
  }

  Future<bool> updateDataGetAnswer({
    required String user_id,
  }) async {
    try {
      GetAnswerQuestionModels dataAnswer =
          await GetAnswerService().getDataAnswerUsers(
        user_id: user_id,
      );

      _getAnswerQuestions = dataAnswer;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
