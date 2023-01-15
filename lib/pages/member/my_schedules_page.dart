import 'package:flutter/material.dart';

class MySchedulePage extends StatefulWidget {
  const MySchedulePage({super.key});

  @override
  State<MySchedulePage> createState() => _MySchedulePageState();
}

class _MySchedulePageState extends State<MySchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MY MEMBERSHIP PLANS',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ExpansionTile(
              collapsedBackgroundColor: Colors.grey, 
              childrenPadding: EdgeInsets.all(16.0),
              leading: Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.green,
              ),
              title: Text(
                'Day 1',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                _getTileRow('Cardio', '15 mins'),
                _getTileRow('Bench Press', '15 mins'),
              ],
            ),
            ExpansionTile(
              childrenPadding: EdgeInsets.all(16.0),
              leading: Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.grey,
              ),
              title: Text(
                'Day 2',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                _getTileRow('Cardio', '15 mins'),
                _getTileRow('Bench Press', '15 mins'),
              ],
            ),
            ExpansionTile(
              childrenPadding: EdgeInsets.all(16.0),
              leading: Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.grey,
              ),
              title: Text(
                'Day 3',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                _getTileRow('Cardio', '15 mins'),
                _getTileRow('Bench Press', '15 mins'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _getTileRow(String name, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Color(0xff4a4a4a),
            fontSize: 20,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            color: Color(0xff4a4a4a),
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
