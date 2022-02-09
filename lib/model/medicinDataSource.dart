
import 'package:flutter/material.dart';
import 'package:medi_calender/model/medicin.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class medicinDataSource extends CalendarDataSource{

medicinDataSource(List<Medicin> appointments){
  this.appointments = appointments;
}
Medicin getMedicin (int index) => appointments![index] as Medicin;

@override
DateTime getStartTime(int index)=> getMedicin(index).from;

@override
DateTime getEndTime(int index)=> getMedicin(index).to;

@override
String getSUbject(int index)=> getMedicin(index).title;

@override
bool isAllDay(int index)=> getMedicin(index).isAllDay;
}