import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// this function for navigate from any screen to other by platform style of navigation
Future navigateTo(context, widget) => Navigator.push(
  context,
  Platform.isIOS? CupertinoPageRoute(builder: (context)=>widget):MaterialPageRoute(builder:(context)=>widget),
);


// this function for navigate from any screen to other by ios style of navigation
Future navigateToIOSStyle(BuildContext context,Widget widget, )  {
  return Navigator.push(
    context,
   CupertinoPageRoute(builder: (context)=>widget),
  );}


// this function for navigate from any screen to other and remove stack of route with platform style of navigation
Future<void> navigateAndFinish(BuildContext context,Widget widget) => Navigator.pushAndRemoveUntil(
    context,
    Platform.isIOS? CupertinoPageRoute(builder: (context)=>widget):MaterialPageRoute(builder:(context)=>widget),
        (Route<dynamic> route) => false);