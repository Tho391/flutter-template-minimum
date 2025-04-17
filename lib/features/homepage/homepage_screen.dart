import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_template/flavors.dart';
import 'package:flutter_template/generated/l10n.dart';

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
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              S.current.greeting,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
