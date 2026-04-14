import 'dart:async';

import 'package:flutter/material.dart';
import 'package:debug_mate/debug_mate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runZonedGuarded(() {
    DebugMateService.init(appId: "demo_app");
    runApp(const MyApp());
    }, (error, stackTrace) {
        DebugMateService.log(
          error.toString(),
          LogLevel.error,
          "system",
        );
      });
      }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => ContentStore(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<String?> _userFuture;

  Future<String?> userValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("UserName");
  }

  @override
  Widget build(BuildContext context) {
    _userFuture = userValue();
    return Scaffold(
      appBar: AppBar(title: const Text("DebugMate Test")),
      body: FutureBuilder<String?>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const UserSignup();
          }

          return DebugScreen();
        }
      ),
    );
  }
}
