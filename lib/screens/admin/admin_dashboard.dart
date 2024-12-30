
import 'package:flutter/material.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/services/auth_service.dart';
import 'produk.dart';

class LandingPage extends StatefulWidget {
   LandingPage({super.key});


  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  final AuthService _authService = AuthService();

  final List<Widget> _container = <Widget>[
    AdminProductPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(226, 231, 174, 127),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 134, 116, 110),
            ),
            icon: Icon(
              Icons.home,
              color: Colors.blueGrey,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.assignment,
              color: Colors.blueGrey,
            ),
            icon: Icon(
              Icons.assignment,
              color: Colors.brown,
            ),
            label: 'PESANAN',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.archive,
              color: Colors.blueGrey,
            ),
            icon: Icon(
              Icons.archive,
              color: Colors.blueGrey,
            ),
            label: 'PRODUK',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.money,
              color: Colors.blueGrey,
            ),
            icon: Icon(
              Icons.money,
              color: Colors.blueGrey,
            ),
            label: 'KEUANGAN',
          ),
        ],
      ),
    );
  }
}

