import 'package:flutter/material.dart';

class iconWidget extends StatelessWidget {
  final IconData iconButton;
  final void Function() iconfunction;
  final Color iconColor;

  const iconWidget(
      {super.key,
      required this.iconButton,
      required this.iconfunction,
      this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
      child: IconButton(
        icon: Icon(
          iconButton,
          size: 29,
          color: iconColor,
        ),
        onPressed: iconfunction,
      ),
    );
  }
}
