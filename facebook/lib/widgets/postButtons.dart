import 'package:flutter/material.dart';

class PostButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              surfaceTintColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.white;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.white;
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
                  Icons.thumb_up_alt_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Text(
                  "Likes",
                  style: TextStyle(fontSize: 15),
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
                  Icons.message_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Text(
                  "Comment",
                  style: TextStyle(fontSize: 15),
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
                  Icons.share_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Text(
                  "Share",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
