import 'package:flutter/material.dart';
import 'package:tareacuentas/screens/send_code_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Para colocar el icono más arriba
              const SizedBox(height: 60),
              const Icon(Icons.account_box_rounded,
                  size: 100, color: Colors.blue),
              const SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(), // Añadir bordes al campo
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(), // Añadir bordes al campo
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity, // Ancho igual al de los inputs
                child: ElevatedButton(
                  onPressed: () {
                    // Agregar funcionalidad para iniciar sesión
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Fondo gris del botón
                    foregroundColor: Colors.white, // Color del texto
                    padding: const EdgeInsets.symmetric(
                      vertical: 20, // Ajustar la altura del botón
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Bordes redondeados
                    ),
                  ),
                  child: const Text('Iniciar sesión'),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SendCodeScreen()),
                  );
                },
                child: const Text(
                  'Recuperar contraseña',
                  style: TextStyle(
                    color: Colors.blue, // Color del texto
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
