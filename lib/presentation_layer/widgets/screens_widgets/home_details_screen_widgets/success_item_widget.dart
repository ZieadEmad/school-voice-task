import 'package:flutter/material.dart';

class SuccessItemWidget extends StatelessWidget {
  const SuccessItemWidget({super.key,required this.newValue,required this.title,this.oldValue});
  final String title;
  final String newValue;
  final String? oldValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$title:',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
        const SizedBox(width: 8,),
        Text(newValue,style: const TextStyle(fontSize: 18),),
        const SizedBox(width: 8,),
        if(oldValue != null&&oldValue!=newValue)
        Text(oldValue!,style: const TextStyle(fontSize: 18,color: Colors.red),),
      ],
    );
  }
}
