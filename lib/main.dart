import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/kategori_page.dart';
import 'pages/favorit_page.dart';
import 'pages/profile_page.dart';
import 'pages/quiz_page.dart';

void main() async {

  // WAJIB sebelum runApp
  WidgetsFlutterBinding.ensureInitialized();

  // SQLITE WINDOWS
  if (Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory =
        databaseFactoryFfi;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false,

      title:
          'Jelajah Jakarta Timur',

      // HALAMAN PERTAMA
      initialRoute: '/login',

      // ROUTE BIASA
      routes: {
        '/login': (context) =>
            const LoginPage(),

        '/register': (context) =>
            const RegisterPage(),
      },

      // ROUTE DENGAN USER DATA
      onGenerateRoute:
          (settings) {

        // AMBIL DATA USER
        final Map<String, dynamic>?
            user = settings.arguments
                as Map<String,
                    dynamic>?;

        switch (settings.name) {

          // HOME
          case '/home':
            return MaterialPageRoute(
              builder: (_) =>
                  HomePage(
                user: user,
              ),
            );

          // KATEGORI
          case '/kategori':
            return MaterialPageRoute(
              builder: (_) =>
                  KategoriPage(
                user: user,
              ),
            );

          // FAVORIT
          case '/favorit':
            return MaterialPageRoute(
              builder: (_) =>
                  FavoritPage(
                user: user,
              ),
            );

          // PROFILE
          case '/profile':
            return MaterialPageRoute(
              builder: (_) =>
                  ProfilePage(
                user: user,
              ),
            );

          // QUIZ
          case '/quiz':
            return MaterialPageRoute(
              builder: (_) =>
                  QuizPage(
                user: user,
              ),
            );

          default:
            return MaterialPageRoute(
              builder: (_) =>
                  const LoginPage(),
            );
        }
      },
    );
  }
}