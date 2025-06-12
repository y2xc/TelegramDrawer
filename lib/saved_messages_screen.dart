import 'package:flutter/material.dart';

class SavedMessagesScreen extends StatelessWidget {
  const SavedMessagesScreen({super.key});

  final List<Map<String, String>> _savedMessages = const [
    {
      'text': 'WiFi: MyHouse - password: coffeelover4',
      'time': 'Today, 14:35 AM',
    },
    {
      'text': 'Call Mom on Friday about dinner plans.',
      'time': 'Yesterday, 3:00 PM',
    },
    {
      'text': 'Gym locker: #142, code: 2580',
      'time': 'April 24, 11:45 AM',
    },
    {
      'text': 'Bills due: Rent(28th), Electricity(1st)',
      'time': 'April 23, 5:30 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Messages')),
      body:
          _savedMessages.isEmpty
              ? const Center(child: Text('No saved messages yet.'))
              : ListView.builder(
                itemCount: _savedMessages.length,
                itemBuilder: (context, index) {
                  final message = _savedMessages[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          message['text']!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          message['time']!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}