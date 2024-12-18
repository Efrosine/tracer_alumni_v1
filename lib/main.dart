import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tracer_alumni_v1/model/prodi.dart';
import 'package:tracer_alumni_v1/nav_bar.dart';
import 'package:tracer_alumni_v1/service_api.dart';
import 'package:tracer_alumni_v1/view/signin_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
