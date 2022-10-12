import 'dart:convert';

import 'package:map_fields/map_fields.dart';

class TypesUserModel {
  final String id;
  final String name;
  final String description;

  TypesUserModel({
    required this.id,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory TypesUserModel.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);
    return TypesUserModel(
      id: mapFields.getString('id', ''),
      name: mapFields.getString('name', ''),
      description: mapFields.getString('description', ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory TypesUserModel.fromJson(String source) =>
      TypesUserModel.fromMap(json.decode(source));
}
