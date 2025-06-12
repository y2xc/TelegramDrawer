import 'package:flutter/material.dart';

class TelegramFeaturesScreen extends StatelessWidget {
  const TelegramFeaturesScreen({super.key});

  final List<Map<String, String>> _features = const [
    {
      'title': 'Boundless Storage',
      'description': 'Free cloud storage for all your media and documents.',
    },
    {
      'title': 'End-to-end Encryption',
      'description': 'Ensure your private chats are swecured through end-to-end encryption.',
    },
    {
      'title': 'Groups & Channels',
      'description': 'Set up large group chats and establish broadcast channels.',
    },
    {
      'title': 'File Exchange',
      'description': 'Easily send and receive substantial files, regardless of format.',
    },
    {
      'title': 'Stickers, GIFs & Emojis',
      'description': 'Express yourself with fun and engaging media.',
    },
    {
      'title': 'Cloud-based',
      'description': 'Access your messages from any device.',
    },
    {
      'title': 'Voice & Video Calls',
      'description': 'Make clear and reliable calls to your contacts.',
    },
    {
      'title': 'Bots',
      'description': 'Automate tasks and enhance your experience with bots.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Telegram Features')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: _features.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (context, index) {
          final feature = _features[index];
          return ListTile(
            title: Text(
              feature['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(feature['description']!),
            ),
          );
        },
      ),
    );
  }
}
