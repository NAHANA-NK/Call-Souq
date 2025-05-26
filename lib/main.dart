import 'package:flutter/material.dart';
import 'package:loginss/presentation/login/components/login.dart';
import 'package:loginss/presentation/profile/components/profile.dart';
import 'package:loginss/presentation/splash/components/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: Homescreen(token: 'c2345b7509665a6cce3e97f0eb730221bb75d5ac',),
    );
  }
}
