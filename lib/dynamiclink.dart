// dynamic_link_service.dart
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkService {
  Future<String> createDynamicLink(String postId) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse('https://yourapp.page.link/post/$postId'),
      uriPrefix: 'https://yourapp.page.link',
      androidParameters: AndroidParameters(
        packageName: 'com.example.yourapp',
        minimumVersion: 1,
      ),
      iosParameters: IOSParameters(
        bundleId: 'com.example.yourapp',
        minimumVersion: '1.0.1',
      ),
    );

    final ShortDynamicLink shortLink = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    return shortLink.shortUrl.toString();
  }
}
