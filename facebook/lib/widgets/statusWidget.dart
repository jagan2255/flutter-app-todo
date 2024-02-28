import 'package:facebook/widgets/iconWidget.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final String CardTitle;
  final String ImageUri;
  final bool isProfile;

  StatusWidget(
      {required this.CardTitle, required this.ImageUri, this.isProfile = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      height: 240,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(ImageUri),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: isProfile
                ? Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(ImageUri),
                    ),
                  )
                : iconWidget(
                    iconButton: Icons.add,
                    iconfunction: () {},
                    iconColor: Colors.blueAccent),
          ),
          Positioned(
              bottom: 10,
              left: 20,
              child: Text(
                CardTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ))
        ],
      ),
    );
  }
}
