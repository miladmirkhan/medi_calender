import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medi_calender/model/medicin.dart';
import 'package:medi_calender/model/medicinDataSource.dart';
import 'package:medi_calender/provider/medicinProvider.dart';
import 'package:medi_calender/screens/eventViewingPage.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class TasksWidget extends StatefulWidget {
  
  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {

    final provider=Provider.of<MedicinProvider>(context);

    final selectMedicins=provider.medicinOfSlectedDate;

    if(selectMedicins.isEmpty){
      return Center(
        child: Text('no medication found!'
        ,style: TextStyle(color: Colors.black,fontSize: 24),
        ),
     ); 
   }
   return SfCalendarTheme(
     data: SfCalendarThemeData(
       timeTextStyle: TextStyle(fontSize: 16,color:Colors.black)
     ),
     child: SfCalendar(
       view: CalendarView.timelineDay,
       dataSource: medicinDataSource(provider.Medicins),
       initialDisplayDate: provider.seletedDate,
       appointmentBuilder: appointmentBuilder,
       headerHeight: 0,
       todayHighlightColor: Colors.tealAccent,
       selectionDecoration: BoxDecoration(
         color: Colors.blueAccent.withOpacity(0.5),
       ),
       onTap: (details){
         if(details.appointments==null)return;

         final Medicin=details.appointments!.first;

         Navigator.of(context).push(MaterialPageRoute(
           builder: (context)=> medicinViewingPage(medicin:Medicin),
           ));
       },
     ),
   );
    
  }
  Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ){
    final Medicin=details.appointments.first;

    return Container(
      width: details.bounds.width,
      height: details.bounds.height,

      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(Medicin.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}