import 'package:e_learning_app/features/Auth/presentation/pages/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();

          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 300,
                              width: 350,
                              child: Image.asset(
                                'assets/1.PNG',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: Center(
                                child: Text(
                                  "Let\'s you in",
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Container(
                              child: MaterialButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 25,
                                        width: 30,
                                        child: Image.asset(
                                          'assets/facebook.png',
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Continue with Facebook',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  print("go to facebook");
                                },
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Container(
                              child: MaterialButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 25,
                                        width: 30,
                                        child: Image.asset(
                                          'assets/google.png',
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Continue with Google',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  print("go to google");
                                },
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Container(
                              child: MaterialButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 25,
                                        width: 30,
                                        child: Image.asset(
                                          'assets/apple.png',
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Continue with Apple',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  print("go to apple");
                                },
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
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
                                      'or',
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Container(
                              child: MaterialButton(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Text(
                                  'Sign in with password',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Don\'t have an account?",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " Sign up",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()),
                                      ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue,
                                    ),
                                  ),
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
        ),
      ),
    );
  }
}