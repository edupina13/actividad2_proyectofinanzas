import 'package:flutter/material.dart';
import 'package:tareacuentas/Widgets/splash_screen.dart';
import 'package:tareacuentas/modules/auth/screens/create_account.dart';
import 'package:tareacuentas/modules/auth/screens/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:tareacuentas/screens/home.dart';
import 'package:tareacuentas/screens/profile.dart';
import 'package:tareacuentas/screens/send_code_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => Login(),
        '/register': (context) => const CreateAccount(),
        '/send_code': (context) =>  SendCodeScreen(),
        '/home': (context) => const home(),
        '/profile': (context) => const profile(),
      },
    );
  }
}
