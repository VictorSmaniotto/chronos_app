import 'package:chronos_app/widgets/card_projetos.dart';
import 'package:chronos_app/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

import 'Pages/eventos_page.dart';
import 'Pages/home_page.dart';
import 'Pages/mural_page.dart';
import 'Pages/perfil_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _paginaIndex = 0;

  final List<Widget> paginas = [
    const HomePage(),
    const PerfilPage(),
    const MuralPage(),
    const EventosPage(),
  ];
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Confira os novos projetos em destaque',
              style: TextStyle(
                  fontSize: 14,
                  // color: Color(0xFF0052A1),
                  fontWeight: FontWeight.bold),
            ),
          ),
          CardProjetos(),
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
        onTap: (index) {
          setState(() {
            _paginaIndex = index;
          });
        },
        currentIndex: _paginaIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: const Color(0xFF0052A1),
        unselectedIconTheme: const IconThemeData(color: Color(0xFF0052A1)),
        selectedIconTheme:
            const IconThemeData(color: Color.fromRGBO(255, 143, 0, 1)),
      ),
    );
  }
}
