
import 'package:flutter/material.dart';
import 'package:medi_calender/provider/medicinProvider.dart';
import 'package:medi_calender/screens/home_Screen/homeScreen.dart';
import 'package:provider/provider.dart';

class routes extends StatelessWidget {
  const routes({ Key? key }) : super(key: key);

Widget build(BuildContext context)=>ChangeNotifierProvider(
  create: (context)=> MedicinProvider(),
  child: MaterialApp(
          //the Routes
      home: homeScreen(),
        
        
    ),
    );
  
}