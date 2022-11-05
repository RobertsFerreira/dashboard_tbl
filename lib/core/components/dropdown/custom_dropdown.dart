import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  final String text;
  final T? initValue;
  final void Function(T?)? onChanged;
  final bool withExpanded;
  final List<DropdownMenuItem<T>> items;

  const CustomDropDown({
    super.key,
    required this.text,
    this.initValue,
    this.onChanged,
    required this.items,
    this.withExpanded = true,
  });

  Widget expanded() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField<T>(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: text,
          ),
          value: initValue,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget normally() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: text,
        ),
        value: initValue,
        items: items,
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (withExpanded) {
      return expanded();
    }
    return normally();
  }
}
