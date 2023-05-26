import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';

// Colors
//Color(0xFF004A8D)
//Color(0xFF0E6094)
//Color(0xFF0052A1)
//Color(0xFF004587)

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0052A1),
        elevation: 1,
        title: Image.asset(
          'assets/logo-branca.png',
          width: 120,
        ),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.menu),
        // ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Projetos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Projetos',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
