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
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Mural',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Projetos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Perfil',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: const Color(0xFF0052A1),
        unselectedIconTheme: const IconThemeData(color: Color(0xFF0052A1)),
        selectedIconTheme:
            const IconThemeData(color: Color.fromRGBO(255, 143, 0, 1)),
      ),
    );
  }
}
