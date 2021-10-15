import 'package:delit_app/Models/library_models.dart';
import 'package:delit_app/Models/type_question_models.dart';
import 'package:delit_app/Models/user_models.dart';

class QuestionsModels {
  late int? id;
  late UserModels? user;
  late LibraryModels? jenisPertanyaan;
  late String? question;
  late double? rangePoint;
  late bool? reverst;
  late TypeAnswer? typeAnswer;

  QuestionsModels({
    this.id,
    this.user,
    this.jenisPertanyaan,
    this.question,
    this.rangePoint,
    this.reverst,
    this.typeAnswer,
  });

  QuestionsModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = UserModels.fromJson(json['user']);
    jenisPertanyaan = LibraryModels.fromJson(json['jenisPertanyaan']);
    question = json['question'];
    rangePoint = json['rangePoint'];
    reverst = json['reverst'];
    typeAnswer = TypeAnswer.fromJson(json['typeAnswer']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user!.toJson(),
      'jenisPertanyaan': jenisPertanyaan!.toJson(),
      'question': question,
      'rangePoint': rangePoint,
      'reverst': reverst,
      'typeAnswer': typeAnswer,
    };
  }
}
