import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../configs/app_colors.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const NotificationListItemWidget();
      },
    );
  }
}

class NotificationListItemWidget extends StatelessWidget {
  const NotificationListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'New Order arrived for you',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      subtitle: const Text(
        'Order #123 has been placed by John Doe for 2 items of \$50, please check and confirm the order.',
        style: TextStyle(
          color: AppColors.darkGrey,
          fontSize: 12,
        ),
      ),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          LineIcons.shoppingBag,
          color: AppColors.primary,
          size: 28,
        ),
      ),
      trailing: Text('2d ago'),
    );
  }
}
