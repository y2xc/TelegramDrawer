import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _language = 'English';
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'General',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            _buildSwitchSetting(
              title: 'Notifications',
              value: _notificationsEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  _notificationsEnabled = newValue;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Notifications ${newValue ? 'enabled' : 'disabled'}',
                      ),
                    ),
                  );
                });
              },
            ),
            _buildSwitchSetting(
              title: 'Dark Mode',
              value: _darkModeEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  _darkModeEnabled = newValue;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Dark Mode ${newValue ? 'enabled' : 'disabled'}',
                      ),
                    ),
                  );
                });
              },
            ),
            _buildDropdownSetting(
              title: 'Language',
              value: _language,
              items: const [
                'English',
                'French',
                'Amharic',
                'Spanish',
              ], 
              onChanged: (String? newValue) {
                setState(() {
                  _language = newValue!;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Language set to $newValue')),
                  );
                });
              },
            ),
            _buildSliderSetting(
              title: 'Font Size',
              value: _fontSize,
              min: 12.0,
              max: 20.0,
              divisions: 4,
              label: _fontSize.round().toString(),
              onChanged: (double newValue) {
                setState(() {
                  _fontSize = newValue;
                });
              },
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Account',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            _buildListTileSetting(
              title: 'Edit Profile',
              icon: Icons.person_outline,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit Profile tapped')),
                );
              },
            ),
            _buildListTileSetting(
              title: 'Privacy & Security',
              icon: Icons.privacy_tip_outlined,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Privacy & Security tapped')),
                );
              },
            ),
            _buildListTileSetting(
              title: 'Storage and Data',
              icon: Icons.storage_outlined,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Storage and Data tapped')),
                );
              },
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Support',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            _buildListTileSetting(
              title: 'Help',
              icon: Icons.help_outline,
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Help tapped')));
              },
            ),
            _buildListTileSetting(
              title: 'About',
              icon: Icons.info_outline,
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('About tapped')));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchSetting({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: const TextStyle(fontSize: 16.0)),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _buildDropdownSetting({
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: const TextStyle(fontSize: 16.0)),
          DropdownButton<String>(
            value: value,
            items:
                items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildSliderSetting({
    required String title,
    required double value,
    required double min,
    required double max,
    int? divisions,
    String? label,
    required ValueChanged<double> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: const TextStyle(fontSize: 16.0)),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            label: label,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildListTileSetting({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontSize: 16.0)),
      onTap: onTap,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16.0,
        color: Colors.grey,
      ),
    );
  }
}
 