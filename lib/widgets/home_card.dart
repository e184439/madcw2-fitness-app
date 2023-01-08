import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap,
      required this.backgroundColor})
      : super(key: key);

  final String title;
  final String subtitle;
  final Image icon;
  final VoidCallback onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    width: 210.0,
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
