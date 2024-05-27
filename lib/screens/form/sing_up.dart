import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/screens/form/sing_in.dart';
import 'package:e_commerce_provider/screens/nav_botton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kprimarayColor,
      // appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    //color: Colors.orange.shade50,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(400))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 100,
                      ),
                      Text(
                        'sing up',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kcontentColor),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              buildTextField("Name", _nameController, false),
                              buildTextField(
                                  "username", _usernameController, false),
                              buildTextField(
                                  "Password", _passwordController, true),
                              SizedBox(height: 20),
                              Consumer<UserProvider>(
                                  builder: (context, cont, child) {
                                return Container(
                                  width: double.infinity,
                                  //color: kprimarayColor,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cont.registerState ==
                                              RegisterState.loading
                                          ? null
                                          : () => cont.register(
                                                name: _nameController.text,
                                                password:
                                                    _passwordController.text,
                                                username:
                                                    _usernameController.text,
                                                onSuccess: (user) {
                                                  _passwordController.clear();
                                                },
                                                onError: (eror) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(eror
                                                              .toString())));
                                                },
                                              );

                                      if (_formKey.currentState!.validate()) {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomNvbar()),
                                        );
                                      }
                                    },
                                    child: cont.registerState ==
                                            RegisterState.loading
                                        ? const CircularProgressIndicator()
                                        : const Text('Sign Up'),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: kprimarayColor),
                                  ),
                                );
                              }),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                                child: Text('Already have an account? Sign In'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, TextEditingController controller, bool obscureText) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
      ),
    );
  }
}
