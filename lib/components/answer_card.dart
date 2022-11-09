import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final int index;
  final int pointSelect;
  final Function(int?)? onChanged;
  final String text;
  final int limitScore;
  final bool trailing;
  const AnswerCard({
    Key? key,
    required this.index,
    required this.pointSelect,
    required this.text,
    required this.limitScore,
    this.onChanged,
    this.trailing = true,
  }) : super(key: key);

  Widget withTrailing() {
    return Center(
      child: Card(
        child: SizedBox(
          child: Center(
            child: Row(
              children: [
                const SizedBox(width: 10),
                CircleAvatar(
                  child: Text(
                    (index + 1).toString(),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 10),
                  height: 80,
                  width: 60,
                  child: Center(
                    child: DropdownButtonFormField<int>(
                      value: pointSelect,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(
                        limitScore,
                        (index) {
                          return DropdownMenuItem<int>(
                            value: index,
                            child: Text(
                              index.toString(),
                            ),
                          );
                        },
                      ),
                      onChanged: onChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget withoutTrailing() {
    return Center(
      child: Card(
        child: SizedBox(
          height: 80,
          child: Center(
            child: Row(
              children: [
                const SizedBox(width: 10),
                CircleAvatar(
                  child: Text(
                    (index + 1).toString(),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 10),
                  child: Center(
                    child: DropdownButtonFormField<int>(
                      value: pointSelect,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(
                        limitScore,
                        (index) {
                          return DropdownMenuItem<int>(
                            value: index,
                            child: Text(
                              index.toString(),
                            ),
                          );
                        },
                      ),
                      onChanged: onChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (trailing) {
      return withTrailing();
    }
    return withoutTrailing();
  }
}
