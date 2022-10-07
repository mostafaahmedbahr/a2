import 'package:flutter/material.dart';
import 'package:test_google_maps/dio/dio_helper.dart';
import 'package:test_google_maps/test_dropdown.dart';

import 'first_screen.dart';

void main() {
  DioAdanHelper.int();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DropDownScreen(),
    );
  }
}
