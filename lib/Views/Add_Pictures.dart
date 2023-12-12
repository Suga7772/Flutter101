import 'package:flutter/material.dart';

class add_picture extends StatefulWidget {
  const add_picture({super.key});

  @override
  State<add_picture> createState() => _add_pictureState();
}

class _add_pictureState extends State<add_picture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page A"),
      ),
      body: const Center(
        child: Text("Upload Pictures"),
      ),
    );
  }
}
