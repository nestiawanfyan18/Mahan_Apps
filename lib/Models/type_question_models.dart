import 'package:delit_app/Models/library_models.dart';

class TypeAnswer {
  late int? id;
  late LibraryModels? jenisPertanyaan;
  late String? name_type_answer_question;

  TypeAnswer({
    this.id,
    this.jenisPertanyaan,
    this.name_type_answer_question,
  });

  TypeAnswer.fromJson(Map<String, dynamic> json) {
    id:
    json['id'];
    jenisPertanyaan:
    json['jenisPertanyaan'];
    name_type_answer_question:
    json['name_type_answer_question'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jenisPertanyaan': jenisPertanyaan,
      'name_type_answer_question': name_type_answer_question,
    };
  }
}
