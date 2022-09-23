import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function() onPressed;
  final Widget icon;
  final String label;

  const LoginButton(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
        ),
      ),
    );
  }
}
