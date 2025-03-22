import 'package:creartive/core/reusable_component/ColorManager.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8ECF4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: (ColorManager.secondary), size: 30),
          onPressed: () {Navigator.pop(context);},
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: (ColorManager.secondary),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Account"),
            _buildListTile("Edit profile"),
            _buildListTile("Change password"),
            _buildListTile("Security"),
            
            const SizedBox(height: 20),
            _buildSectionTitle("Notification"),
            _buildListTile("App notification"),
            
            const SizedBox(height: 20),
            _buildSectionTitle("More"),
            _buildListTile("Get help"),
            _buildListTile("Language"),
            _buildListTile("About"),
            
            const Spacer(),
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.black54),
                label: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildListTile(String title) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title, style: const TextStyle(fontSize: 16)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
          onTap: () {},
        ),
        Divider(color: Colors.grey.shade300, thickness: 1),
      ],
    );
  }
}