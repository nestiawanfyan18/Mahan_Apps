import 'dart:ffi';

import 'package:delit_app/Models/library_models.dart';
import 'package:delit_app/Models/type_question_models.dart';
import 'package:delit_app/Models/user_models.dart';

class QuestionsModels {
  late int? id;
  late UserModels? user;
  late LibraryModels? jenisPertanyaan;
  late String? question;
  late double? rangePoint;
  late TypeAnswer? typeAnswer;

  QuestionsModels({
    this.id,
    this.user,
    this.jenisPertanyaan,
    this.question,
    this.rangePoint,
    this.typeAnswer,
  });

  QuestionsModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = UserModels.fromJson(json['user']);
    jenisPertanyaan = LibraryModels.fromJson(json['library']);
    question = json['question'];
    rangePoint = double.parse(json['range_point'].toString());
    typeAnswer = TypeAnswer.fromJson(json['type_answer']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user!.toJson(),
      'jenisPertanyaan': jenisPertanyaan!.toJson(),
      'question': question,
      'rangePoint': rangePoint,
      'typeAnswer': typeAnswer!.toJson(),
    };
  }
}
