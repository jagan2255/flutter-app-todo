import 'package:facebook/Assests/Images.dart';
import 'package:flutter/material.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(image),
        ),
        title: TextField(
          decoration: InputDecoration(
              hintText: "Whats on your mind?",
              hintStyle: TextStyle(fontSize: 20, fontFamily: "Roboto"),
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}
