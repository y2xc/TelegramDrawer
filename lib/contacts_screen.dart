import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _contacts =
      _dummyContacts; 
  List<Map<String, String>> _filteredContacts =
      _dummyContacts; 

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterContacts);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterContacts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts =
          _contacts.where((contact) {
            return contact['name']!.toLowerCase().contains(query) ||
                contact['phone']!.toLowerCase().contains(query);
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Contacts',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add Contact tapped')),
              );
            },
          ),
        ],
      ),
      body:
          _filteredContacts.isEmpty
              ? const Center(child: Text('No contacts found.'))
              : ListView.builder(
                itemCount: _filteredContacts.length,
                itemBuilder: (context, index) {
                  final contact = _filteredContacts[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        'assets/user_placeholder.png',
                      ), 
                    ),
                    title: Text(contact['name']!),
                    subtitle: Text(contact['phone']!),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tapped on ${contact['name']}')),
                      );
                    },
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Start New Chat tapped')),
          );
        },
        child: const Icon(Icons.chat),
      ),
    );
  }

  static final List<Map<String, String>> _dummyContacts = [
    {'id': '1', 'name': 'Nati', 'phone': '+1 123 456 7890'},
    {'id': '2', 'name': 'Neba', 'phone': '+1 987 654 3210'},
    {'id': '3', 'name': 'Hope', 'phone': '+1 555 121 2323'},
    {'id': '4', 'name': 'Yod', 'phone': '+1 333 444 5555'},
  ];
}
