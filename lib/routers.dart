
import 'package:flutter/material.dart';
import 'package:medi_calender/screens/home_Screen/homeScreen.dart';

class routes extends StatelessWidget {
  const routes({ Key? key }) : super(key: key);

Widget build(BuildContext context) {
    return MaterialApp(
      
          //the Routes
      initialRoute: '/',
      routes: {
        '/': (context) => homeScreen(),
        
        
        },
    );
  }
}