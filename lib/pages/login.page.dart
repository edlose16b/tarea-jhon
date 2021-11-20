import 'package:bbva/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BBVA'),
        backgroundColor: Color(0xff1c3569),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 40),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'NIP,NIE Tarjeta o Pasaporte'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(hintText: 'Clave de Acceso'),
              ),
              const SizedBox(height: 40),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, HomePage.go());
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
