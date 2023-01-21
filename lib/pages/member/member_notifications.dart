import 'package:flutter/material.dart';

class MemberNotifications extends StatefulWidget {
  const MemberNotifications({super.key});

  @override
  State<MemberNotifications> createState() => _MemberNotificationsState();
}

class _MemberNotificationsState extends State<MemberNotifications> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) => _getNotificationItem(),
          separatorBuilder: (context, index) => const Divider(
                height: 16.0,
              ),
          itemCount: 3),
    );
  }

  Widget _getNotificationItem() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        height: 70.0,
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Color(0xFF006293),
              width: 6.0,
            ),
          ),
          color: Color(0xFFD9F2FF),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.mail_rounded,
              color: Color(0xFFF6B445),
              size: 38.0,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Lorem Ipsum",
                    style: TextStyle(
                      color: Color(0xff4a4a4a),
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "4 Aug, 2022 at 14:37 | 22 mb",
                    style: TextStyle(
                      color: Color(0xff4a4a4a),
                      fontSize: 12,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}
