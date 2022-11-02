import 'package:flutter/material.dart';

class ButtonNavigator extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonNavigator({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .05,
      width: MediaQuery.of(context).size.width * .25,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
