import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Please wait..',
            style: TextStyle(fontSize: 32.0),
          ),
          SizedBox(
            height: 32.0,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
