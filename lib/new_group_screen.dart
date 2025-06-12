import 'package:flutter/material.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({super.key});

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final List<String> _selectedContacts = []; 

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Group'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed:
                _selectedContacts.isNotEmpty &&
                        _groupNameController.text.isNotEmpty
                    ? () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Creating group "${_groupNameController.text}" with ${_selectedContacts.length} contacts',
                          ),
                        ),
                      );
                    }
                    : null, 
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _groupNameController,
              decoration: const InputDecoration(
                hintText: 'Group Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Add Participants',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  _dummyContacts
                      .length, 
              itemBuilder: (context, index) {
                final contact = _dummyContacts[index];
                return CheckboxListTile(
                  title: Text(contact['name']!),
                  subtitle: Text(contact['phone']!),
                  value: _selectedContacts.contains(contact['id']),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedContacts.add(contact['id']!);
                      } else {
                        _selectedContacts.remove(contact['id']);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<Map<String, String>> _dummyContacts = [
    {'id': '1', 'name': 'Nati', 'phone': '+1 123 456 7890'},
    {'id': '2', 'name': 'Neba', 'phone': '+1 987 654 3210'},
    {'id': '3', 'name': 'Hope', 'phone': '+1 555 121 2323'},
    {'id': '4', 'name': 'Yod', 'phone': '+1 333 444 5555'},
  ];
}
