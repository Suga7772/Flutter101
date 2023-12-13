import 'package:flutter/material.dart';

class dummy extends StatelessWidget {
  String name;
  //parameterised constructor
  dummy({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Check'),
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Center(
          child: Column(
            children: [
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
