import 'package:flutter/material.dart';

class ProgressBarQuestion extends StatelessWidget {
  final double percent;
  const ProgressBarQuestion({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        height: 10,
        child: Stack(
          children: [
            Container(
              width: width,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: width * percent,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
