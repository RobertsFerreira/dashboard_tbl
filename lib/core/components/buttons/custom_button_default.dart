import 'package:flutter/material.dart';

class CustomButtonDefault extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData? icon;
  const CustomButtonDefault({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 40,
      width: 120,
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
