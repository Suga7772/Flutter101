// ignore_for_file: camel_case_types, dead_code
import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/Authtentication/login.dart';
import 'package:sqlite_flutter_crud/Views/Add_Pictures.dart';
import 'package:sqlite_flutter_crud/Views/notes.dart';
import 'package:sqlite_flutter_crud/Views/student_details.dart';

// ignore: must_be_immutable
class studentinterface extends StatefulWidget {
  String name;
  studentinterface({required this.name, Key? key});
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 129, 96, 139),
        title: const Text(
          '            S t u d e n t I n t e r f a c e',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 220, 188, 230),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 129, 96, 139),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Welcome ${widget.name}!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Rectangle block containers
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              // Remove one of the named arguments for the 'width' parameter
              color: Color.fromARGB(255, 129, 96, 139).withOpacity((0.4)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Color.fromARGB(255, 129, 96, 139).withOpacity((0.4)),
            ),
            // Navigation bar
            BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.browse_gallery), label: 'Add Picture'),
                BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Notes'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Your Info'),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
