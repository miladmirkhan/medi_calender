import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titlColors;
  final Color? backColor;
  const MyAppBar({Key? key, required this.title,this.titlColors,this.backColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: titlColors),),
      backgroundColor: backColor,
      shadowColor: Colors.transparent,
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}