// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/pages/home_page.dart';
import 'package:netflix_clone/pages/sign_in.dart';
import 'package:netflix_clone/pages/temp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // GestureBinding.instance.resamplingEnabled = true;
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        // primarySwatch: Colors.blue,
      ),
      // themeMode: ThemeMode.dark,
      initialRoute: SignIn.id,
      routes: {
        HomePage.id:(context) => HomePage(),
        Temp.id:(context) => Temp(),
        SignIn.id:(context) => SignIn(),
      },
    );
  }
}
