// text_post_screen.dart
import 'package:flutter/material.dart';

class TextPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Post')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is a sample text post.'),
            ElevatedButton(
              onPressed: () => _sharePost(context, 'Sample Text Post Link'),
              child: Text('Share'),
            ),
          ],
        ),
      ),
    );
  }

  void _sharePost(BuildContext context, String link) {
    // Implement dynamic link generation and sharing logic here
  }
}
