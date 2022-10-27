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
        color: onTap != null
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: width,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            if (icon != null && text.isNotEmpty) const SizedBox(width: 10),
            if (text.isNotEmpty)
              Center(
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
