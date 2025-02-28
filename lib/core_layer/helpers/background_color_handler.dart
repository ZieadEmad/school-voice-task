import 'package:flutter/material.dart';

Color backgroundHandler(int temp){
  if(temp <10) {return Colors.blue;}
  else if (temp <=35) {return Colors.green;}
  else {return Colors.red;}
}