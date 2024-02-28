import 'package:facebook/widgets/statusWidget.dart';
import 'package:flutter/material.dart';
import '../Assests/Images.dart';

class HomeStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          StatusWidget(
              CardTitle: 'Add To Story', ImageUri: image, isProfile: false),
          StatusWidget(CardTitle: 'Minu', ImageUri: image2),
          StatusWidget(CardTitle: 'Floki', ImageUri: image3),
          StatusWidget(CardTitle: 'PePe', ImageUri: image4),
          StatusWidget(CardTitle: 'Shib Inu', ImageUri: image5),
        ],
      ),
    );
  }
}
