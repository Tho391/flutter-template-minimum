import 'dart:core';

import 'package:flutter/material.dart';

import '../../configs/flavors.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title), // Using title from F class
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Hello ${F.title}', // Displaying title dynamically
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
