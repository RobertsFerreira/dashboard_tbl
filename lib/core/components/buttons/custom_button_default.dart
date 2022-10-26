import 'package:flutter/material.dart';

class CustomButtonDefault extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData? icon;
  final double height;
  final double width;
  const CustomButtonDefault({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
    this.height = 40,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
            Visibility(
              visible: icon != null,
              child: const SizedBox(width: 10),
            ),
            Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
