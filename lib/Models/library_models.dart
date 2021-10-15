class LibraryModels {
  late int? id;
  late String? name;
  late int? category_id_primary;
  late int? category_id_second;

  LibraryModels({
    this.id,
    this.name,
    this.category_id_primary,
    this.category_id_second,
  });

  LibraryModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category_id_primary = json['category_id_primary'];
    category_id_second = json['category_id_second'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_id_primary': category_id_primary,
      'category_id_second': category_id_second,
    };
  }
}
