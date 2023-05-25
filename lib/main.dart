import 'dart:io';

import 'package:covid19_test/Screens/GetStartedScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/Symptoms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Screens/Motivation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Rubik',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const GetStartedScreen();
  }





}
