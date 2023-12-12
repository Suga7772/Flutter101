// ignore_for_file: camel_case_types, dead_code
import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/Authtentication/login.dart';
import 'package:sqlite_flutter_crud/Views/Add_Pictures.dart';
import 'package:sqlite_flutter_crud/Views/notes.dart';
import 'package:sqlite_flutter_crud/Views/student_details.dart';

class studentinterface extends StatefulWidget {
  const studentinterface({super.key});
  @override
  State<studentinterface> createState() => _studentinterfaceState();
}

class _studentinterfaceState extends State<studentinterface> {
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
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Rectangle block containers
          Container(
            width: 150,
            height: MediaQuery.of(context).size.height * 0.1,
            // Remove one of the named arguments for the 'width' parameter
            color: Color.fromARGB(255, 129, 96, 139).withOpacity(.4),
          ),
          Container(
            width: 250,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Color.fromARGB(255, 129, 96, 139).withOpacity(.4),
          ),
          // Navigation bar
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.image), label: 'Add Pictures'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Notes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Your Info'),
            ],
          ),
        ],
      ),
    );
  }
}
