import 'dart:convert';

class ProductModel {
  static const colName = "name";
  static const colEarnCode = "earn_code";
  static const colId = "_id";
  static const colImage = 'image';

  String? name;
  String? earnCode;
  String? id;
  String? image;
  ProductModel({
    this.name,
    this.earnCode,
    this.id,
    this.image,
  });

  ProductModel copyWith({
    String? name,
    String? earnCode,
    String? id,
    String? image,
  }) {
    return ProductModel(
      name: name ?? this.name,
      earnCode: earnCode ?? this.earnCode,
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'earn_code': earnCode,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] != null ? map['name'] as String : null,
      earnCode: map['earn_code'] != null ? map['earn_code'] as String : null,
      id: map['_id'] != null ? map['_id'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, earnCode: $earnCode, id: $id, image: $image)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.earnCode == earnCode &&
        other.id == id &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^ earnCode.hashCode ^ id.hashCode ^ image.hashCode;
  }
}
