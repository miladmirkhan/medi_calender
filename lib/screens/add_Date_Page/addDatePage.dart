import 'package:flutter/material.dart';
import 'package:medi_calender/model/medicin.dart';
import 'package:medi_calender/provider/medicinProvider.dart';
import 'package:medi_calender/widgets/Utils.dart';
import 'package:provider/provider.dart';

class medicinEditingPage extends StatefulWidget {
 final Medicin? medicin;

const medicinEditingPage({
  Key? key,
    this.medicin,
    }):super(key: key);

  @override
  _medicinEditingPageState createState() => _medicinEditingPageState();
}

class _medicinEditingPageState extends State<medicinEditingPage> {
final _formKey=GlobalKey<FormState>();
final titleController=TextEditingController();
late DateTime fromDate;
late DateTime toDate;

@override
void initState(){
  super.initState();

  if(widget.medicin==null){
  fromDate=DateTime.now();
  toDate=DateTime.now().add(Duration(hours: 1));
  }else{
    final Medicin=widget.medicin!;

    titleController.text=Medicin.title;
    fromDate=Medicin.from;
    toDate=Medicin.to;
  }
}

void dispose(){
  titleController.dispose();

  super.dispose();
}

  @override
  Widget build(BuildContext context) => Scaffold( 
    appBar: AppBar(
        leading: CloseButton(),
        actions: buildEditingActions(),
        ),

        body:SingleChildScrollView(
          padding:EdgeInsets.all(12) ,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                  bulldTitle(),
                  SizedBox(height: 12),
                  buildDataTimePicker(),
              ],
            ),
          ),
        ),
    );
   
   List<Widget> buildEditingActions()=>[
     ElevatedButton.icon(
        style:ElevatedButton.styleFrom(
           primary:Colors.transparent,
           shadowColor: Colors.transparent,
         ),
       onPressed: saveForm,
        icon: Icon(Icons.done),
         label: Text("Save")),];

         Widget bulldTitle()=>TextFormField(
           style: TextStyle(fontSize:24),
           decoration: InputDecoration(
             border: UnderlineInputBorder(),
             hintText: 'Add Title',
           ),
           onFieldSubmitted: (_)=>saveForm,
           validator:(title)=>
           title !=null && title.isEmpty ?'Title cannot be empty!!':null ,
           controller: titleController,
         );

        Widget buildDataTimePicker()=>Column(
          children: [
            buildFrom(),
            buildTo(),
          ],
        );

        Widget buildFrom()=>buildHeader(
          header:'FROM',
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: buildDropdawnField(
                text: Utils.toDate(fromDate),
                onClicked:()=> pickFromDateTime(pickDate: true),
              )
              ),
              Expanded(
                child: buildDropdawnField(
                  text: Utils.toTime(fromDate),
                   onClicked: ()=>pickFromDateTime(pickDate: false),
                   ),
                   ),
            ],
            ),
        );

        Widget buildTo()=>buildHeader(
          header:'To',
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: buildDropdawnField(
                text: Utils.toDate(toDate),
                onClicked:()=>picktoDateTime(pickDate:true),
              )
              ),
              Expanded(
                child: buildDropdawnField(
                  text: Utils.toTime(toDate),
                   onClicked: ()=>picktoDateTime(pickDate:false),
                   ),
                   ),
            ],
            ),
        );

//fromdate
        Future pickFromDateTime({required bool pickDate}) async{
          final date= await pickDateTime(fromDate, pickDate: pickDate);
          if(date==null)
          return;

if(date.isAfter(toDate)){
  toDate=
  DateTime(date.year,date.month,date.day,toDate.hour,toDate.minute);
}

          setState(() =>fromDate=date);
 }
        
//todate
        Future picktoDateTime({required bool pickDate}) async{
          final date= await pickDateTime(
            toDate,
             pickDate: pickDate,
             firstDate: pickDate ? fromDate: null,
             );
          if(date==null)
          return;

          setState(() =>toDate=date);
        }

        Future <DateTime?>pickDateTime(
          DateTime intialDate,{
            required bool pickDate,
            DateTime? firstDate,
          }) async{
            if(pickDate){
             final date=await showDatePicker(
               context: context,
                initialDate: intialDate, 
                firstDate: firstDate ?? DateTime(2000,2), 
                lastDate: DateTime(2100),

             );
            if(date==null)return null;

              final time=Duration(hours: intialDate.hour,minutes: intialDate.minute);
            return date.add(time);
              } else{
          
               final  timeOfDay = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(intialDate),
            );  
            if(timeOfDay==null)return null;

            final date=
                DateTime(intialDate.year,intialDate.month,intialDate.day);
                final time=Duration(hours: timeOfDay.hour,minutes: timeOfDay.minute);

              return date.add(time);
          }
        }

      Widget buildDropdawnField({
        required String text,
        required VoidCallback onClicked,
      })=>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

      Widget buildHeader({
        required Widget child,
        required String header,
      })=>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,style: TextStyle(fontWeight: FontWeight.bold)),
         child,
        ],
      );
    
     Future saveForm() async{
        final isValid=_formKey.currentState!.validate();

        if (isValid){
          final medicin=Medicin(
            title: titleController.text,
            description: "descreption", 
            from: fromDate,
             to: toDate, 
             isAllDay: false,
             );
             
              final isEditing=widget.medicin!=null;
              final provider=Provider.of<MedicinProvider>(context,  listen: false );
                Navigator.of(context).pop(); 
                print("it work");
               if(isEditing){
                    provider.editMedicin(medicin,widget.medicin!);
                    Navigator.of(context).pop(); 
               }else{
                provider.addMedicin(medicin);
                 Navigator.of(context).pop(); 
               }
              
              
        }

       
      }

     
  }