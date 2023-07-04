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
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_rounded)),
        ],
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/projeto3.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}
