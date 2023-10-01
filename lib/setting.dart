import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(SettingsApp());
}

class SettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black, // Set background color to black
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Notification Settings'),
              trailing: Switch(
                value: false,
                onChanged: (newValue) {
                  // Handle switch state changes
                },
              ),
            ),
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (newValue) {
                  setState(() {
                    isDarkMode = newValue;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PasswordResetDialog(
                      mainContext: context, // Pass the context here
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                // Handle tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordResetDialog extends StatefulWidget {
  final BuildContext mainContext; // Add this field

  PasswordResetDialog({required this.mainContext}); // Constructor

  @override
  _PasswordResetDialogState createState() => _PasswordResetDialogState();
}

class _PasswordResetDialogState extends State<PasswordResetDialog> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  void _resetPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      Navigator.pop(context);
      // Show success message
      ScaffoldMessenger.of(widget.mainContext).showSnackBar(SnackBar(
        content: Text('Password reset email sent.'),
      ));
    } catch (e) {
      print('Error sending password reset email: $e');
      // Show error message
      ScaffoldMessenger.of(widget.mainContext).showSnackBar(SnackBar(
        content: Text('Error sending password reset email.'),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Reset Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isLoading ? null : _resetPassword,
            child: _isLoading ? CircularProgressIndicator() : Text('Reset Password'),
          ),
        ],
      ),
    );
  }
}
