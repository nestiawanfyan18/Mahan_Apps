import 'package:delit_app/Models/library_models.dart';
import 'package:delit_app/Models/type_question_models.dart';
import 'package:delit_app/Models/user_models.dart';

class TypeAnswerPWBModel {
  late int? id;
  late int? user_id;
  late int? library_question_id;
  late int? type_question_id;
  late int? point_answer;

  TypeAnswerPWBModel(
    List<TypeAnswerPWBModel> sublist, {
    this.id,
    this.user_id,
    this.library_question_id,
    this.type_question_id,
    this.point_answer,
  });

  TypeAnswerPWBModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    library_question_id = json['library_question_id'];
    type_question_id = json['type_question_id'];
    point_answer = json['point_answer'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'library_question_id': library_question_id,
      'type_question_id': type_question_id,
      'point_answer': point_answer,
    };
  }
}
