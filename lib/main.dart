import 'package:emart_seller_app/consts/firebase_consts.dart';
import 'package:emart_seller_app/consts/string.dart';
import 'package:emart_seller_app/ui/screens/home_screen/home.dart';
import 'package:emart_seller_app/ui/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  var isLoggedIn = false;
  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        isLoggedIn = false;
      } else {
        isLoggedIn = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
      ),
      home: isLoggedIn ? const Home() : const LoginScreen(),
    );
  }
}
