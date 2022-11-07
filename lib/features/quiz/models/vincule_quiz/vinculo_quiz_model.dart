import 'dart:convert';

import 'package:dashboard_tbl/utils/hasura/helper_extensions.dart';
import 'package:map_fields/map_fields.dart';

class VinculoQuizModel {
  final String title;
  final DateTime date;
  final List<CustomGroup> groups;

  VinculoQuizModel({
    required this.title,
    required this.date,
    required this.groups,
  });

  factory VinculoQuizModel.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);

    final groupMap = mapFields.getList<Map<String, dynamic>>('groups');

    final groups = groupMap.map((e) => CustomGroup.fromMap(e)).toList();

    return VinculoQuizModel(
      title: mapFields.getString('title'),
      date: mapFields.getDateTime('date'),
      groups: groups,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date.toDateHasuraWithoutTime(),
      'groups': groups.map((e) => e.toMap()).toList(),
    };
  }

  String toJson() => jsonEncode(toMap());
}

class CustomGroup {
  final String reference;
  final String nameLeader;

  CustomGroup({
    required this.reference,
    required this.nameLeader,
  });

  factory CustomGroup.fromMap(Map<String, dynamic> map) {
    MapFields mapFields = MapFields.load(map);

    return CustomGroup(
      reference: mapFields.getString('reference'),
      nameLeader: mapFields.getString('name'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reference': reference,
      'name': nameLeader,
    };
  }

  String toJson() => jsonEncode(toMap());
}
