import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tareacuentas/kernel/widgets/custome_text_field_password.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60), // Espacio arriba
              const Icon(Icons.account_box_rounded,
                  size: 100, color: Colors.blue),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: validateEmail,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        border: OutlineInputBorder(), // Bordes en el input
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextFieldPassword(controller: _passwordController),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity, // Ancho igual al de los inputs
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                            print('credencial: $credential');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No se encontró un usuario con ese correo.');
                            } else if (e.code == 'wrong-password') {
                              print('Contraseña incorrecta.');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // Fondo gris del botón
                          foregroundColor: Colors.white, // Color del texto
                          padding: const EdgeInsets.symmetric(
                            vertical: 20, // Ajustar altura del botón
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
                          ),
                        ),
                        child: const Text('Iniciar sesión'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(
                          color: Colors.blue, // Color del texto
                          decoration: TextDecoration.underline, // Subrayado
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/send_code');
                      },
                      child: const Text(
                        'Recuperar contraseña',
                        style: TextStyle(
                          color: Colors.blue, // Color del texto
                          decoration: TextDecoration.underline, // Subrayado
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
