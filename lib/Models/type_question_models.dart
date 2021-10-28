import 'package:delit_app/Models/library_models.dart';

class TypeAnswer {
  late int? id;
  late int? library_question_id;
  // late LibraryModels? jenisPertanyaan = null;
  late String? name_type_answer_question;

  TypeAnswer({
    this.id,
    // this.jenisPertanyaan,
    this.name_type_answer_question,
  });

  TypeAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    library_question_id = json['library_question_id'];
    // jenisPertanyaan = LibraryModels?.fromJson(json['library']);
    name_type_answer_question = json['name_type_answer_question'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'library_question_id': library_question_id,
      // 'jenisPertanyaan': jenisPertanyaan!.toJson(),
      'name_type_answer_question': name_type_answer_question,
    };
  }
}
