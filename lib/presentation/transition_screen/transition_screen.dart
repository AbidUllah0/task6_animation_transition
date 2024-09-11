import 'package:flutter/material.dart';
import '../hero_screen/hero_screen.dart';
import '../slide_transition_screen/slide_transition_screen.dart';

class ScreenTransitionScreen extends StatelessWidget {
  const ScreenTransitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen Transitions')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,

                ///Page Route Builder
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SlideTransitionScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: const Text('Slide Transition'),
          ),
          Hero(
            tag: 'hero-tag',
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HeroScreen()),
                );
              },
              child: const Text('Hero Transition'),
            ),
          ),
        ],
      ),
    );
  }
}
