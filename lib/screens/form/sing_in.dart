import 'package:e_commerce_provider/screens/constant.dart';
import 'package:e_commerce_provider/screens/form/sing_up.dart';
import 'package:e_commerce_provider/screens/nav_botton.dart';
import 'package:flutter/material.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Icon(Icons.person,size: 100,),
                      Text('welcome to sing in',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                      Text('.......',style: TextStyle(fontSize: 20),)
                    ],
                  ),
                   
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 100,horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(labelText: 'Email'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                          ),
                        ),
                         Align(
                          alignment: Alignment.centerRight,
                           child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                            },
                            child: Text("Don't have an account? ",style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.black54
                            ),),
                                                 ),
                         ),
                        SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kprimarayColor
                          ),
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kprimarayColor
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNvbar()));
                              }
                            },
                            child: Text('Sign In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ),
                         TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                          },
                          child: Text("Forget password"),
                        )
                       
                      ],
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
}
