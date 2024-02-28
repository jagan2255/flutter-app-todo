import 'package:facebook/Assests/Images.dart';
import 'package:facebook/Section/homeButtons.dart';
import 'package:facebook/Section/homeCreateRooms.dart';
import 'package:facebook/Section/homePost.dart';
import 'package:facebook/Section/homeStatus.dart';
import 'package:facebook/Section/statusSection.dart';
import 'package:facebook/widgets/iconWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "facebook",
          style: TextStyle(
              color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          iconWidget(iconButton: Icons.search, iconfunction: () {}),
          iconWidget(iconButton: Icons.chat, iconfunction: () {})
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const StatusSection(),
            Divider(
              thickness: 1,
              color: Colors.grey[300],
            ),
            const HomeButton(),
            const SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 10,
              color: Colors.grey[300],
            ),
            const CreateRooms(),
            Divider(
              thickness: 10,
              color: Colors.grey[300],
            ),
            HomeStatus(),
            Divider(
              thickness: 10,
              color: Colors.grey[300],
            ),
            HomePosts(
                ImageUri: image3,
                profileName: 'Floki',
                postTitle: 'Hello',
                postUri: image4),
            Divider(
              thickness: 10,
              color: Colors.grey[300],
            ),
            HomePosts(
                ImageUri: image4,
                profileName: 'Pepe',
                postTitle: 'To Moon',
                postUri: image2),
            Divider(
              thickness: 10,
              color: Colors.grey[300],
            ),
            HomePosts(
                ImageUri: image5,
                profileName: 'Shiba Inu',
                postTitle: 'Buy the Dip',
                postUri: image3),
            Divider(
              thickness: 10,
              color: Colors.grey[300],
            ),
            HomePosts(
                ImageUri: image3,
                profileName: 'Minu',
                postTitle: '1dollar soon',
                postUri: image5),
            Divider(
              thickness: 10,
              color: Colors.grey[300],
            ),
            HomePosts(
                ImageUri: image3,
                profileName: 'Floki',
                postTitle: 'Hello',
                postUri: image4),
            Divider(
              thickness: 10,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
