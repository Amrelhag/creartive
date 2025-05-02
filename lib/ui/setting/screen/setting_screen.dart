import 'package:creartive/ui/login/screen/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName='setting';
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8ECF4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF210C54), size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Setting",
          style: TextStyle(
            color: Color(0xFF210C54),
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
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                },
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
          onTap: () {

          },
        ),
        Divider(color: Colors.grey.shade300, thickness: 1),
      ],
    );
  }
}
