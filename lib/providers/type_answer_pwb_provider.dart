import 'package:delit_app/Models/type_answer_pwb.dart';
import 'package:delit_app/services/type_answer_service.dart';
import 'package:flutter/cupertino.dart';

class TypeAnswerPWBProvider with ChangeNotifier {
  List<TypeAnswerPWBModel> _typeAnswerPWB = [];
  List<TypeAnswerPWBModel> get typeAnswer => _typeAnswerPWB;

  set questionPWB(List<TypeAnswerPWBModel> typeAnswers) {
    _typeAnswerPWB = typeAnswers;
    notifyListeners();
  }

  Future<void> getQuestions({
    required int user_id,
  }) async {
    try {
      List<TypeAnswerPWBModel>? getTypeAnswers =
          await TypeAnswerService().getTypeAnswer(user_id: user_id);

      _typeAnswerPWB = getTypeAnswers!;
    } catch (e) {
      print(e);
    }
  }
}
