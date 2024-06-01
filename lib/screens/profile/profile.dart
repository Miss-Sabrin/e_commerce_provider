import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/screens/form/sing_in.dart';
import 'package:e_commerce_provider/screens/form/sing_up.dart';
import 'package:e_commerce_provider/screens/profile/profile_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarayColor,
        centerTitle: true,
        title: const Text(
          'profile',
          style: TextStyle(
              color: kcontentColor, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final box = GetStorage();
                box.remove(kUserInfo);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.login,
                size: 22,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Consumer<UserProvider>(
              builder: (context, cont, child) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    InstaImageViewer(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: 
                            // cont.user.photo ??
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    itemProfile('Name', cont.user.name ?? "Rina",
                        CupertinoIcons.person),
                    const SizedBox(
                      height: 10,
                    ),
                    itemProfile('userName', cont.user.username ?? "sabka",
                        CupertinoIcons.phone),
                    const SizedBox(
                      height: 10,
                    ),
                    itemProfile('password', '',
                        CupertinoIcons.location),
                    const SizedBox(
                      height: 10,
                    ),
                    // itemProfile(
                    //     'email', "saabsiman080@gmail.com", CupertinoIcons.mail),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    Container(
                      
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kprimarayColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: ProfileUpdate(
                                      userModel: cont.user,
                                    ),
                                    type: PageTransitionType.fade));
                          },
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                );
              },
            )),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0.1),
                color: kprimarayColor.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 3)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward),
        tileColor: Colors.white,
      ),
    );
  }
}
