import 'package:delit_app/Models/library_models.dart';
import 'package:delit_app/Models/user_models.dart';

class GetAnswerQuestionModels {
  late int? id;
  late UserModels? user;
  late LibraryModels? jenisPertanyaan;
  late double? point_answer;

  GetAnswerQuestionModels({
    this.id,
    this.user,
    this.jenisPertanyaan,
    this.point_answer,
  });

  GetAnswerQuestionModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = UserModels.fromJson(json['user']);
    jenisPertanyaan = LibraryModels.fromJson(json['jenis_pertanyaan']);
    point_answer = double.parse(json['point_answer'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user!.toJson(),
      'jenisPertanyaan': jenisPertanyaan!.toJson(),
      'point_answer': point_answer,
    };
  }
}
