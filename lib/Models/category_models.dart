class CategoryModels {
  late int? id;
  late String? name;

  CategoryModels({
    this.id,
    this.name,
  });

  CategoryModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
