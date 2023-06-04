import 'package:flutter/material.dart';
import 'package:tstore/homepage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //systemNavigationBarColor: Colors.black, // Color of the bottom navigation bar
      statusBarColor: Colors.blue, // Color of the status bar
    ),
  );

   runApp(DevicePreview(
    enabled: false,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-Store',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: const MyHomePage());
  }
}