import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tareacuentas/kernel/widgets/custome_text_field_password.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cuenta'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60), // Espacio superior
              const Icon(Icons.account_circle, 
                size: 100, 
                color: Colors.blue, // Color del ícono de crear cuenta
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                    ),
                    const SizedBox(height: 20),
                    TextFieldPassword(controller: _password),
                    const SizedBox(height: 20),
                    TextFieldPassword(
                      controller: _confirmPassword,
                      hintText: 'Confirmar contraseña',
                      labelText: 'Confirmar contraseña',
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity, // Botón ancho como el formulario
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                  email: _email.text, 
                                  password: _password.text
                                );
                            print('credencial: $credential');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                              print('El correo ya está en uso.');
                            } else if (e.code == 'weak-password') {
                              print('La contraseña es muy débil.');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // Fondo gris del botón
                          foregroundColor: Colors.white, // Color del texto
                          padding: const EdgeInsets.symmetric(
                            vertical: 20, // Altura del botón
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Crear cuenta'),
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
