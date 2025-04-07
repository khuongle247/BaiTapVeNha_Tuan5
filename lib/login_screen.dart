import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'profile_sreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User? _user;

  @override
  void initState() {
    super.initState();
    // Kiểm tra xem người dùng đã đăng nhập chưa
    _user = FirebaseAuth.instance.currentUser;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/uth_logo.jpg', width: 150),
              const SizedBox(height: 20),
              const Text(
                "SmartTasks",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              // Nếu có người dùng hiện tại, hiển thị nút "Tiếp tục với [tên]"
              if (_user != null) ...[
                CircleAvatar(
                  backgroundImage: _user!.photoURL != null
                      ? NetworkImage(_user!.photoURL!)
                      : null,
                  radius: 30,
                  child: _user!.photoURL == null
                      ? Text(
                    _user!.displayName?[0] ?? 'U',
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  )
                      : null,
                ),
                const SizedBox(height: 10),
                Text("Tiếp tục với ${_user!.displayName}"),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen(user: _user!)),
                    );
                  },
                  child: const Text("Tiếp tục"),
                ),
                const SizedBox(height: 30),
                const Text("Hoặc đăng nhập bằng tài khoản khác"),
              ],

              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () async {
                  User? user = await signInWithGoogle();
                  if (user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen(user: user)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Đăng nhập thất bại")),
                    );
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text("Đăng nhập với Google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
