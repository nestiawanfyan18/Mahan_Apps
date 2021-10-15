import 'package:delit_app/Models/questions_models.dart';
import 'package:delit_app/page/pwb/QuestionPWB.dart';
import 'package:delit_app/services/question_service.dart';
import 'package:flutter/cupertino.dart';

class QuestionsProvider with ChangeNotifier {
  List<QuestionsModels> _question = [];
  List<QuestionsModels> get questionPWB => _question;

  set questionPWB(List<QuestionsModels> questions) {
    _question = questions;
    notifyListeners();
  }

  Future<void> getQuestions() async {
    try {
      List<QuestionsModels> questions =
          await QuestionService().getQuestionPWB();

      _question = questions;
    } catch (e) {
      print(e);
    }
  }
}
