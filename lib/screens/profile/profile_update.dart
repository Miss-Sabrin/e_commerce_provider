import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/model/user_model.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:provider/provider.dart';

class ProfileUpdate extends StatefulWidget {
  final UserModel userModel;
  ProfileUpdate({super.key, required this.userModel});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userModel.name ?? '';
    usernameController.text = widget.userModel.username ?? '';
    // Add more initial values if needed
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kprimarayColor,
            title: const Center(
              child: Text(
                "Profile Updated",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 118, vertical: 0),
                child: InstaImageViewer(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      provider.user.photo ??
                          'https://www.shreegastrocare.com/image/girl-avtar.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "name",
                        hoverColor: kprimarayColor,
                        iconColor: kprimarayColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        hintText: 'username',
                        hoverColor: kprimarayColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: 'password',
                        hoverColor: kprimarayColor,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    provider.updateState == RegisterState.loading
                        ? const CircularProgressIndicator()
                        : Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kprimarayColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (provider.user.id!.isNotEmpty) {
                                  if (passwordController.text.isEmpty ||
                                      passwordController.text == '') {
                                    provider.updateProfile(
                                      userId: provider.user.id!,
                                      newName: nameController.text,
                                      newUsername: usernameController.text,
                                      newPassword: passwordController.text,
                                      onSuccess: (user) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Profile Updated')),
                                        );
                                      },
                                      onError: (error) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(content: Text(error)),
                                        );
                                      },
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Password Cannot be empty')));
                                  }
                                }

                                print('UserId: ${provider.user.id}');
                              },
                              child: const Text(
                                'Update Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
