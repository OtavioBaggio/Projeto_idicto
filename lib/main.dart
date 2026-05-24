import 'package:flutter/material.dart';
import 'package:idicto/screens/onboarding_screen.dart';
import 'package:idicto/screens/perfil_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/apoio_screen.dart';


void main() {
  runApp(const IDICTOApp());
}

class IDICTOApp extends StatelessWidget {
  const IDICTOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/apoio': (context) => const ApoioScreen(),
        '/perfil': (context) => const PerfilScreen(),
      },
    );
  }
}