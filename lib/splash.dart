import 'package:todo_list/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TasksScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200, // Width of the container
              height: 200, // Height of the container
              decoration: BoxDecoration(
                // Box decoration for styling the container (optional)
                color: Colors.white, // Background color of the container
                borderRadius:
                    BorderRadius.circular(10), // Border radius of the container
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                // ClipRRect to clip the image to the rounded corners of the container
                borderRadius: BorderRadius.circular(
                    10), // Border radius same as container
                child: Image.asset(
                  'assets/logo.jpg', // Path to your image asset
                  fit: BoxFit.cover, // Fit the image to cover the container
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
