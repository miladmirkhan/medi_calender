import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 486,
                width: 331,
                color: Color(0xE300B5CE),
              ),
            ),
             Container(
               flex:4,
               height: 40,
              color: Color(0xFF144286f),
            ),
            
          ],
        ),
      ),
      );
  }
}