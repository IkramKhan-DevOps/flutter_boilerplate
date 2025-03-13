import 'package:flutter/material.dart';

import '../core/configs/app_colors.dart';
import '../core/widgets/app_bar_widgets.dart';
import '../core/widgets/notification_list_widgets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        actions: [
          IconButton(
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.03),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                size: 20,
                Icons.notifications_none_outlined,
                color: AppColors.darkGrey,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),

      // LIST OF NOTIFICATIONS [heading, subtitle, icon, date]
      body: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Orders',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: NotificationListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
