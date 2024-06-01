import 'package:e_commerce_provider/constanst/constants.dart';
import 'package:e_commerce_provider/provider/user.dart';
import 'package:e_commerce_provider/screens/form/sing_in.dart';
import 'package:e_commerce_provider/screens/bottom_navigations.dart';
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
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
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
                        'Sign Up',
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
                                  "Username", _usernameController, false),
                              buildTextField(
                                  "Password", _passwordController, true),
                              SizedBox(height: 20),
                              Consumer<UserProvider>(
                                  builder: (context, cont, child) {
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        cont.register(
                                          name: _nameController.text,
                                          password: _passwordController.text,
                                          username: _usernameController.text,
                                          onSuccess: (user) {
                                            _passwordController.clear();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Registration successful')));
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()),
                                            );
                                          },
                                          onError: (error) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        error.toString())));
                                          },
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
