import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyUTSApp());
}

class MyUTSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS Pemrograman Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
