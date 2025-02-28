import 'package:flutter/material.dart';

class SuccessItemWidget extends StatelessWidget {
  const SuccessItemWidget({super.key,required this.value,required this.title});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$title:',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
        const SizedBox(width: 8,),
        Text(value,style: const TextStyle(fontSize: 18),),
      ],
    );
  }
}
