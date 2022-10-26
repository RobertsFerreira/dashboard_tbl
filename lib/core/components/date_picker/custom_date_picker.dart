import 'package:flutter/material.dart';

Future<DateTime?> customDatePicker(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2018),
    lastDate: DateTime.now().add(
      const Duration(days: 365),
    ),
  );
}
