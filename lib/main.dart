import 'package:flutter/material.dart';
import 'package:news/controller/homescreencontroller.dart';
import 'package:news/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (context) => Homescreen_provider(),)
       ],
      child: MaterialApp(
       home: splash_screen(),debugShowCheckedModeBanner: false,
      ),
    );
  }
}

