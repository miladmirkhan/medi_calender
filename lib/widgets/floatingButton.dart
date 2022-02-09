import 'package:flutter/material.dart';
import 'package:medi_calender/screens/add_Date_Page/addDatePage.dart';

class MyFloatingButton extends StatelessWidget  {
  
  const MyFloatingButton({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add, color: Colors.black,),
        backgroundColor: Color(0xffffffff),
        onPressed: ()=> Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>medicinEditingPage())
        ),
        );
  }
}