import 'package:flutter/material.dart';
import 'package:medi_calender/widgets/appBar.dart';
import 'package:medi_calender/widgets/calender.dart';

class calenderScreen extends StatefulWidget {
  const calenderScreen({ Key? key }) : super(key: key);

  @override
  _calenderScreenState createState() => _calenderScreenState();
}

class _calenderScreenState extends State<calenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Calender"),

      body: calenderWidget(),
      
    );
  }
}