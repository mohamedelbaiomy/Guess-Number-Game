import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:random_number/provider.dart';
import 'package:random_number/random_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NumberProvider(),
      builder: (context, child) {
        return const GetMaterialApp(
          title: 'Random',
          debugShowCheckedModeBanner: false,
          home: RandomAppScreen(),
        );
      },
    );
  }
}
