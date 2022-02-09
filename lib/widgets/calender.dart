import 'package:flutter/material.dart';
import 'package:medi_calender/model/medicinDataSource.dart';
import 'package:medi_calender/provider/medicinProvider.dart';
import 'package:medi_calender/widgets/TasksWidget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calenderWidget extends StatelessWidget {
  const calenderWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final medicin=Provider.of<MedicinProvider>(context).Medicins;

    return SfCalendar(
      view:CalendarView.month,
      dataSource: medicinDataSource(medicin) ,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      onLongPress: (details){
        final provider=Provider.of<MedicinProvider>(context,listen: true);
           
           provider.setDate(details.date!);

          showModalBottomSheet(
            context: context,
             builder:(context)=>TasksWidget(),);
      },
    );
  }
}