import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:medi_calender/model/medicin.dart';
import 'package:medi_calender/widgets/appBar.dart';
import 'package:medi_calender/widgets/calender.dart';
import 'package:medi_calender/widgets/floatingButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
 List<Medicin> list = [];
  late SharedPreferences sharedPreferences;


   int _currentIndex = 0;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(title: "Home Screen",titlColors: Colors.black,backColor: Colors.white,),
      body: Column(
         children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                   width: double.infinity,
                  color: Color(0xffFFEED7),
                  child: Row(
                    children: [          
                       Container(
                          margin: EdgeInsets.all(5),
                      width: 100.0,
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          image:  DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('accets/images/person-icon.png')
                          )
                      )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("hello,"),
                              Text(" Milad",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20),),
                            ],
                          ),
                           Divider(
                             height: 5,
                           ),
                           Text("      How is your health?"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
           Expanded( 
             flex: 4,
             child: Container( 
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
               width: double.maxFinite,
               child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5)
                    ),
                   child: calenderWidget(), 
          //        child: SfCalendar(
          //            view: CalendarView.week,
          //            firstDayOfWeek: 6,
          //            todayHighlightColor: Colors.blueAccent,
          //           backgroundColor: Color(0xff0044ff),
          //            cellBorderColor: Colors.transparent,
          //            selectionDecoration: BoxDecoration(//decorate slected box
					// 	color: Colors.transparent,
					// 	border: Border.all(
					// 	color: Colors.red, width: 2),
					// 	borderRadius: const BorderRadius.all(Radius.circular(44)),
					// 	shape: BoxShape.rectangle,
					// ),
                     
          //            ),
               ),
               height: 40,
                       ),
           ),
        ],
      ),
      floatingActionButton: MyFloatingButton(),

       bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        backgroundColor: Colors.white,
        
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            inactiveColor: Colors.black,
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calender'),
            inactiveColor: Colors.black,
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('User'),
             inactiveColor: Colors.black,
            activeColor: Colors.amberAccent,
            textAlign: TextAlign.center,
          )]
         
          ),
       );


    Widget buildPages(){
      switch (_currentIndex){
        case 0:
        default:
        return homeScreen();
      }
    } 



  }
} 