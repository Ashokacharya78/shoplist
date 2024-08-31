import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoplist2/shop_list/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shop-list',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green[100],
          body: const home_shop(),
        ),
      ),
    );
  }
}
