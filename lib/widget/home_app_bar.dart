import 'package:flutter/material.dart';

class CusttomAppBar extends StatelessWidget {
  const CusttomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                'E-Commerse',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'flutter dev',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  'images/image1.png',
                ),
              ),
              trailing: Icon(
                Icons.notification_add_outlined,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
