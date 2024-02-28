import 'package:facebook/Assests/Images.dart';
import 'package:facebook/widgets/SliderRoom.dart';
import 'package:flutter/material.dart';

class CreateRooms extends StatelessWidget {
  const CreateRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 70,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.video_call,
            size: 28,
          ),
          label: const Text(
            "Create \nRoom",
            style: TextStyle(fontSize: 15),
          ),
        ),
        SliderRoom(
          imageUri: image,
        ),
        SliderRoom(
          imageUri: image2,
        ),
        SliderRoom(
          imageUri: image3,
        ),
        SliderRoom(
          imageUri: image4,
        ),
        SliderRoom(
          imageUri: image5,
        ),
        SliderRoom(
          imageUri: image2,
        ),
        SliderRoom(
          imageUri: image3,
        ),
        SliderRoom(
          imageUri: image4,
        ),
      ]),
    );
  }
}
