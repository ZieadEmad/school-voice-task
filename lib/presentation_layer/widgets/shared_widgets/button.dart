import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key,required this.onPress,required this.buttonColor,required this.borderRadiusValue,required this.buttonTitle,required this.buttonTitleColor});
  final VoidCallback onPress ;
  final Color buttonColor ;
  final double borderRadiusValue;
  final String buttonTitle;
  final Color buttonTitleColor;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadiusValue)
        ),
        child:  Padding(
          padding: const EdgeInsets.only(left: 26.0,right: 26,top: 8,bottom: 8),
          child: Text(
            buttonTitle,
            style: TextStyle(color: buttonTitleColor,fontSize: 18),
          ),
        ),
      ),
    );
  }
}
