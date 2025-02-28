import 'package:flutter/material.dart';

class HomeDetailsLoadingWidget extends StatelessWidget {
  const HomeDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}
