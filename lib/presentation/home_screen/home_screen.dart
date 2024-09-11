import 'package:flutter/material.dart';
import '../animated_list_screen/animated_list_screen.dart';
import '../button_feed_back_screen/button_feed_back_screen.dart';
import '../transition_screen/transition_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedListScreen()),
                );
              },
              child: const Text('Animated List'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ButtonFeedbackScreen()),
                );
              },
              child: const Text('Button Feedback'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScreenTransitionScreen()),
                );
              },
              child: const Text('Screen Transition'),
            ),
          ],
        ),
      ),
    );
  }
}
