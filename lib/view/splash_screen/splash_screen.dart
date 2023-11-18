import 'package:flutter/material.dart';
import 'package:news/view/bottomscreen/bottomscreen.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => BottomNavScreen()))); //user screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body:
       Center(
         child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Image.network("https://th.bing.com/th/id/OIP.AMLBdskC5TYc-JKNSdUWdgHaEL?w=238&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",fit: BoxFit.fill,)
             ],),
       ),
    );
  }
}