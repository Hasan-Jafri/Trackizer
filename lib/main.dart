import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/view/main_tabview/main_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trackizer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
            seedColor: Tcolor.primary,
            background: Tcolor.grey80,
            primary: Tcolor.primary,
            primaryContainer: Tcolor.grey60,
            secondary: Tcolor.secondary),
        useMaterial3: false,
      ),
      home: const MainTab(),
    );
  }
}
