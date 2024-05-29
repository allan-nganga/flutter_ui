import 'package:todo_list/screens/login_page.dart';
import 'package:todo_list/screens/tasks_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return const TasksScreen();
          }
          // user is NOT logged in
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
