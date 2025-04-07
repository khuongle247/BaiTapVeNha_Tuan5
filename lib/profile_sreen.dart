import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    DateTime? dateOfBirth = user.metadata.creationTime;
    String formattedDate = dateOfBirth != null
        ? DateFormat('dd/MM/yyyy').format(dateOfBirth)
        : "Not set";

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepOrange,
              child: Text(
                (user.displayName?.isNotEmpty == true)
                    ? user.displayName![0].toUpperCase()
                    : "P",
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
              backgroundImage: user.photoURL?.isNotEmpty == true
                  ? NetworkImage(user.photoURL!)
                  : null,
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              controller:
              TextEditingController(text: user.displayName ?? "N/A"),
              decoration: const InputDecoration(
                labelText: "Name",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: user.email ?? "N/A"),
              decoration: const InputDecoration(
                labelText: "Email",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: formattedDate),
              decoration: const InputDecoration(
                labelText: "Date of Birth",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {

                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();



                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
