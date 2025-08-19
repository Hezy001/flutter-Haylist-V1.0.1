import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: Colors.deepPurple, // Change the color here
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}