
import 'package:flutter/material.dart';
import 'package:midlinkassingment/text_post.dart';
import 'package:midlinkassingment/video_post_screen.dart';

import 'image_post_screen.dart';

class Botomnav extends StatefulWidget {
  const Botomnav({Key? key}) : super(key: key);

  @override
  State<Botomnav> createState() => _BotomnavState();
}

class _BotomnavState extends State<Botomnav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    TextPostScreen(),
    VideoPostScreen(),
    ImagePostScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Text Post'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Video Post'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image Post'),
        ],
      ),
    );
  }
}
