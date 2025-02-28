import 'package:flutter/material.dart';

class HomeDetailsErrorWidget extends StatelessWidget {
  const HomeDetailsErrorWidget({super.key,required this.error});
  final String error ;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
