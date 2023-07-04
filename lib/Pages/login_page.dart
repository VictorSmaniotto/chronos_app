import 'package:flutter/material.dart';

import 'cadastrar_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void loginUser() {
    if (_formKey.currentState!.validate()) {
      debugPrint("Enviado");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logoChronos.png'),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "E-mail"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor, informe o e-mail";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Senha"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor, informe a senha";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loginUser,
                    child: const Text("Entrar"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Não tem uma conta?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastrarPage(),
                      ),
                    );
                  },
                  child: const Text('Cadastre-se'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
