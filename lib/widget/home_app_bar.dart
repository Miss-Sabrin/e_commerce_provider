import 'package:e_commerce_provider/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CusttomAppBar extends StatelessWidget {
  const CusttomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Consumer<UserProvider>(builder: (context, cont, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  cont.user.name ?? '',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                leading: CircleAvatar(
                  radius: 30,
                  // backgroundImage: NetworkImage(
                  //   // cont.user.photo?[0] ??
                  //       "https://example.com/default_avatar.png",
                  // ),
                  child: Image.network(
                      'https://avatars.githubusercontent.com/u/11613304?v=4'),
                ),
                trailing: const Icon(
                  Icons.notification_add_outlined,
                  size: 30,
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
