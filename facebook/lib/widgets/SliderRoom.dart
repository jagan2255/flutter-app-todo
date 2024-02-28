import 'package:facebook/Assests/Images.dart';
import 'package:flutter/material.dart';

class SliderRoom extends StatelessWidget {
  final String imageUri;

  SliderRoom({required this.imageUri});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(imageUri),
          ),
          Positioned(
            right: 2,
            bottom: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1)),
            ),
          )
        ],
      ),
    );
  }
}
