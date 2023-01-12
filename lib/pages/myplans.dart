import 'package:flutter/material.dart';

class myplans extends StatelessWidget {
  const myplans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('MY MEMBERSHIP PLANS'),
        backgroundColor: Color(0xff127157),
        toolbarHeight: 100.0, // double
        centerTitle: true,
      ),
    );
  }
}
