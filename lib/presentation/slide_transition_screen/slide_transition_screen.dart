import 'package:flutter/material.dart';

class SlideTransitionScreen extends StatelessWidget {
  const SlideTransitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slide Transition')),
      body: Center(
        child: const Text('This screen slid in!'),
      ),
    );
  }
}
