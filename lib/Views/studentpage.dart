import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/Views/Add_Pictures.dart';
import 'package:sqlite_flutter_crud/Views/notes.dart';
import 'package:sqlite_flutter_crud/Views/student_details.dart';

class studentPage extends StatefulWidget {
  String name;
  studentPage({Key? key, required this.name}) : super(key: key);

  @override
  State<studentPage> createState() => _studentPageState();
}

class _studentPageState extends State<studentPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to different pages based on the index
    switch (_selectedIndex) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const add_picture()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Notes()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Details()),
        );
        break;
    }
  }

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
                "Welcomeee ${widget.name}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
