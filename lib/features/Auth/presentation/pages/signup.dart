import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          //onPressed: () => Navigator.of(context).pop(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => login()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                            child: Positioned(
                                child: Text(
                                  "Creat Your \nAccount",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          SizedBox(height: 20,),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: buildTextFormField(
                                    prefixIcon: Icons.email,
                                    controller: emailController,
                                    labelText: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Email';
                                      } else if (!RegExp(
                                          r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                ),
                                SizedBox(
                                  child: buildTextFormField(
                                    prefixIcon: Icons.lock_rounded,
                                    controller: passwordController,
                                    labelText: 'Password',
                                    suffixIcon: isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    obscureText: !isPasswordVisible,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.length < 8 ||
                                          !RegExp(r'^(?=.?[a-z])(?=.?[A-Z])(?=.*?[0-9])')
                                              .hasMatch(value)) {
                                        return 'Password must be at least 8 characters with a mix of uppercase, lowercase, and numbers';
                                      }
                                      return null;
                                    },
                                    onTapSuffix: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                  width: double.infinity,
                                  height: 100,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Checkbox(
                                    value: _isChecked,
                                    activeColor: Colors.blue,
                                    onChanged: (value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 100,),
                                  Text(
                                    "Remember me",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: Container(
                              child: MaterialButton(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    print('form submiitted');
                                  }
                                },
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 1),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      height: 2,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      'or continue with',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 2,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            print("go to facebook");
                                          },
                                          child: Container(
                                              height: 40,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade300)),
                                              child: Image.asset(
                                                'assets/facebook.png',
                                              )),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            print("go to google");
                                          },
                                          child: Container(
                                              height: 40,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade300)),
                                              child: Image.asset(
                                                'assets/google.png',
                                              )),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            print("go to apple");
                                          },
                                          child: Container(
                                              height: 40,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade300)),
                                              child: Image.asset(
                                                'assets/apple.png',
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Already have an account?",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " Sign in",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => login()),
                                      ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue,
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          )
                        ]),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    IconData? suffixIcon,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
    VoidCallback? onTapSuffix,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: GestureDetector(
            onTap: onTapSuffix,
            child: Icon(suffixIcon),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.5),
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}