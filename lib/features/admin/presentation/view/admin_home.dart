import 'package:flutter/material.dart';
import 'package:wist/core/constants/constant_value.dart';
import 'package:wist/core/widgets/HeaderAmbulance.dart';
import 'package:wist/features/admin/presentation/view/AdminHomeContent.dart';
import 'package:wist/features/admin/presentation/view/admin_block.dart';
import 'package:wist/features/admin/presentation/view/admin_user.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    AdminHomeContent(),
    AdminUser(),
    AdminBlock(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderAmbulance(
            HeaderImage: KMainImage,
            TitleString: "ADMIN",
          ),
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.red),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.red),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.block, color: Colors.red),
            label: 'Blocked',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
