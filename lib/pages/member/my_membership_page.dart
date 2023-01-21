import 'package:flutter/material.dart';
import 'package:madcw2_fitness/util/app_theme.dart';
import 'package:madcw2_fitness/widgets/rounded_button.dart';

class MyMembershipPage extends StatefulWidget {
  const MyMembershipPage({Key? key}) : super(key: key);

  @override
  State<MyMembershipPage> createState() => _MyMembershipPageState();
}

class _MyMembershipPageState extends State<MyMembershipPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _getMembershipPlanItem(),
          const SizedBox(
            height: 32.0,
          ),
          RoundedButton(
            buttonText: 'Active',
            onPressed: () {},
            isDisabled: false,
          )
        ],
      ),
    );
  }

  Widget _getMembershipPlanItem() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: 200.0,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000),
              blurRadius: 16,
              offset: Offset(0, 0),
            ),
          ],
          border: Border(
            left: BorderSide(
              color: Color(0xff127157),
              width: 6.0,
            ),
          ),
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            Text(
              "Membership card",
              style: TextStyle(
                color: AppTheme.buttonColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Member Name",
                      style: TextStyle(
                        color: Color(0xff4a4a4a),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "James Wong",
                      style: TextStyle(
                        color: Color(0xff052351),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "No",
                      style: TextStyle(
                        color: Color(0xff4a4a4a),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "F45667",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff052351),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 19.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Date Valid",
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "02/01/2023",
                      style: TextStyle(
                        color: Color(0xff052351),
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 14.0,
                    ),
                    Text(
                      "to",
                      style: TextStyle(
                        color: Color(0xff052351),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 14.0,
                    ),
                    Text(
                      "01/01/2024",
                      style: TextStyle(
                        color: Color(0xff052351),
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
