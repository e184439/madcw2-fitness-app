import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  const GridButton({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        height: 120.0,
        width: (MediaQuery.of(context).size.width / 100) * 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 10,
              offset: Offset(0, 1),
            ),
          ],
          color: Color(0xfff4f4f4),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 40.0,
                width: 40.0,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffe51561),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
      ),
    );
  }
}
