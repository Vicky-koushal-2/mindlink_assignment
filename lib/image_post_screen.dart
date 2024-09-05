// image_post_screen.dart
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
// import 'dynamic_link_service.dart'; // Assuming you have the DynamicLinkService implemented in this file.
import 'dynamiclink.dart';
class ImagePostScreen extends StatelessWidget {
  final String postId = "image-post-1"; // A unique ID for the post, which you can modify based on actual post data.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://via.placeholder.com/300', // Replace with your image URL or asset.
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _sharePost(context),
              child: Text('Share'),
            ),
          ],
        ),
      ),
    );
  }

  void _sharePost(BuildContext context) async {
    // Generate the dynamic link for the specific image post.
    String link = await DynamicLinkService().createDynamicLink(postId);

    // Share the generated link using the share_plus package.
    Share.share('Check out this amazing image post: $link');
  }
}
