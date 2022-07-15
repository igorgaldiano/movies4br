import 'package:flutter/material.dart';

class ProgressLoad extends StatelessWidget {
  const ProgressLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Center(
      // ignore: prefer_const_constructors
      child: CircularProgressIndicator(), //Show indicator
    );
  }
}
