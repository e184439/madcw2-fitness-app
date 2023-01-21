import 'package:flutter/material.dart';
import 'package:madcw2_fitness/util/app_theme.dart';

class AdBanner extends StatelessWidget {
  final String imagePath;
  const AdBanner({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 180,
      color: Colors.grey.shade100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 8.0,
                  bottom: 8.0,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 64.0,
                    height: 64.0,
                  ),
                ),
                Positioned(
                    left: 16.0,
                    top: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "UP TO",
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                              ),
                            ],
                            color: Colors.white,
                            fontSize: 24.0,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Text(
                          "40% OFF",
                          style: TextStyle(
                            // add text shadow
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                              ),
                            ],
                            color: Colors.white,
                            fontSize: 32.0,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "JOIN US",
                          style: TextStyle(
                            shadows: const [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                              ),
                            ],
                            color: AppTheme.buttonColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
