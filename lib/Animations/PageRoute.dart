import 'package:flutter/cupertino.dart';

 Route route(Widget page){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation){
        return page;
      },
      transitionDuration:Duration(milliseconds: 500) ,
      transitionsBuilder:(context, animation, secondaryAnimation, child){
        return FadeTransition(opacity: animation,child: child,);
      }
  );
}