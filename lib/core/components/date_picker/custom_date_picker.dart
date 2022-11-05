import 'package:flutter/material.dart';

Future<DateTime?> customDatePicker(
  BuildContext context, {
  DateTime? initialDate,
}) async {
  return await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(2018),
    lastDate: DateTime.now().add(
      const Duration(days: 365),
    ),
  );
}
