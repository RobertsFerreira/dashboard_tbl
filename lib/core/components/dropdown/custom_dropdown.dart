import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  final String text;
  final T? initValue;
  final void Function(T?)? onChanged;
  final bool withExpanded;
  final List<DropdownMenuItem<T>> items;
  final double height;
  final double width;
  final bool withSize;

  const CustomDropDown({
    super.key,
    required this.text,
    this.initValue,
    this.onChanged,
    required this.items,
    this.withExpanded = true,
    this.height = 60,
    this.width = 200,
    this.withSize = false,
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

  Widget sizeOffset() {
    return SizedBox(
      width: width,
      height: height,
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
    if (withSize) {
      return sizeOffset();
    }
    return normally();
  }
}
