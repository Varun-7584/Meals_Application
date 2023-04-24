import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newmeals/Login/screens/homepage/home_page.dart';
import 'package:newmeals/Login/screens/login/login.dart';
import 'package:newmeals/myhomepage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyHomepage();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
