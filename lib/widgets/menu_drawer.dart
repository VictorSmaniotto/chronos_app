import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0052A1),
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              SizedBox(
                height: 63,
                child: DrawerHeader(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Image.asset(
                    'assets/logo-branca.png',
                    width: 10,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.all_inbox,
                  color: Color(0xFFFFFFFF),
                ),
                title: const Text(
                  'Projetos',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                ),
                onTap: () {
                  //Função para abrir a página projetos
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFFFFFFFF),
                ),
                title: const Text(
                  'Eventos',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                ),
                onTap: () {
                  //Função para abrir a página projetos
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.article_outlined,
                  color: Color(0xFFFFFFFF),
                ),
                title: const Text(
                  'Mural de Pedidos',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                ),
                onTap: () {
                  //Função para abrir a página projetos
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.chat_bubble_outline,
                  color: Color(0xFFFFFFFF),
                ),
                title: const Text(
                  'Fale Conosco',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                ),
                onTap: () {
                  //Função para abrir a página projetos
                },
              ),
              const Divider(
                color: Colors.white,
              ),
              const ListTile(
                title: Text(
                  'Política de Privacidade',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
