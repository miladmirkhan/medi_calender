import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        centerTitle: true ,
       title: Text("main screen"),
       ),
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
                      width: 150.0,
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
                           Text("How is your health?"),
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
                    
                 child: SfCalendar(
                     view: CalendarView.week,
                     firstDayOfWeek: 6,
                     todayHighlightColor: Colors.blueAccent,
                    backgroundColor: Colors.teal,
                     cellBorderColor: Colors.transparent,
                     selectionDecoration: BoxDecoration(//decorate slected box
						color: Colors.transparent,
						border: Border.all(
						color: Colors.red, width: 2),
						borderRadius: const BorderRadius.all(Radius.circular(44)),
						shape: BoxShape.rectangle,
					),
                     
                     ),
               ),
               height: 40,
                       ),
           ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: (){},
      ),


      );
  }
}