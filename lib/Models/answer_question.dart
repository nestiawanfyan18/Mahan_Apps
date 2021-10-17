import 'package:delit_app/Models/library_models.dart';
import 'package:delit_app/Models/user_models.dart';

class AnswerQuestionModels {
  late int? id;
  late int? user;
  late int? jenisPertanyaan;
  late double? point_answer;

  AnswerQuestionModels({
    this.id,
    this.user,
    this.jenisPertanyaan,
    this.point_answer,
  });

  AnswerQuestionModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    jenisPertanyaan = json['libary'];
    point_answer = double.parse(json['point_answer'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'jenisPertanyaan': jenisPertanyaan,
      'point_answer': point_answer,
    };
  }
}
