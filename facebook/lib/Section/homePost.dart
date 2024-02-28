import 'package:facebook/widgets/postButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePosts extends StatelessWidget {
  final String ImageUri;
  final String profileName;
  final String postTitle;
  final String postUri;

  HomePosts(
      {required this.ImageUri,
      required this.profileName,
      required this.postTitle,
      required this.postUri});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(ImageUri),
            ),
            title: Row(
              children: [
                Text(
                  profileName,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent, shape: BoxShape.circle),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                )
              ],
            ),
            subtitle: Row(
              children: [
                Text(
                  "5h",
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.public,
                  size: 17,
                )
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ),
          Text(
            postTitle,
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(
            height: 15,
          ),
          Image.network(
            postUri,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.thumb_up,
                  color: Colors.grey[700],
                ),
                Container(
                  child: Row(
                    children: [
                      Text("1K Comments"),
                      SizedBox(
                        width: 12,
                      ),
                      Text("20K Shares"),
                      SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(ImageUri),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Divider(
            thickness: 1,
          ),
          PostButtons(),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}
