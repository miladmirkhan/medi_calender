

import 'package:flutter/material.dart';
import 'package:medi_calender/model/medicin.dart';
import 'package:medi_calender/provider/medicinProvider.dart';
import 'package:provider/provider.dart';

import 'add_Date_Page/addDatePage.dart';


class medicinViewingPage extends StatelessWidget {
  final Medicin medicin;

const medicinViewingPage({Key? key,required this.medicin}):super (key: key);
  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      leading: CloseButton(),
      actions: buildViewingActions(context,medicin),
    ),
    body: ListView(
      padding: EdgeInsets.all(32),
      children:<Widget> [
        buildDateTime(medicin),
        SizedBox(height: 32,),
        Text(
          medicin.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.amber),
          ),
          const SizedBox(height: 24),
          Text(
            medicin.description,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.amber),
          )
      ],
    ),
  );

  Widget buildDateTime(Medicin medicin){
    return Column(
      children: [
        buildDate(medicin.isAllDay?'all-day':'Form',medicin.from),
        if(!medicin.isAllDay) buildDate('To',medicin.to),
      ],
    );
  }

  Widget buildDate(String title,DateTime date){
    
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(title,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        Text(date.toString(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        
      ],),
    );
  }
  List<Widget> buildViewingActions(BuildContext context,Medicin medicin)=>
  [
    IconButton(icon: Icon(Icons.edit),onPressed: ()=> Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder:(context)=>medicinEditingPage(medicin: medicin),
         ),
    ),
    ),

    IconButton(icon: Icon(Icons.edit),onPressed: (){
      final provider=Provider.of<MedicinProvider>(context, listen: true);

      provider.deleteMedicin(medicin);
    },),
    ];
      
  }
    
  
  
  