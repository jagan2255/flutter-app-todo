import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              surfaceTintColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.white; // Change the background color to white
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.white; // Change the background color to white
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
              ),
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Icon(
                  Icons.video_call,
                  size: 25,
                  color: Colors.red,
                ),
                SizedBox(width: 5),
                Text(
                  "Live",
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
          VerticalDivider(
            color: Colors.grey[300],
            thickness: 1,
          ),
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(),
              ),
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Icon(
                  Icons.picture_as_pdf,
                  size: 25,
                  color: Colors.green,
                ),
                SizedBox(width: 5),
                Text(
                  "Photo",
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
          VerticalDivider(
            color: Colors.grey[300],
            thickness: 1,
          ),
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(),
              ),
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Icon(
                  Icons.video_call,
                  size: 25,
                ),
                SizedBox(width: 5),
                Text(
                  "Room",
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
