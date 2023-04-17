import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/BackEnd/AuthService/auth_service.dart';
import 'package:sorttrash/StartPage/LoginPage/Cred/login_cred.dart';
import 'package:sorttrash/StartPage/LoginPage/Cred/login_resgister_buttons.dart';
import 'package:sorttrash/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _auth = AuthService();
  final _mykey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg-image.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 390,
                      width: 500,
                      color: Colors.transparent,
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 190,
                    child: Container(
                        height: 340,
                        width: 400,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white54,
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 8), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Form(
                            key: _mykey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO( 	103, 	235, 	0, 1),
                                      side: const BorderSide(
                                          width: 1, color: Colors.black38),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: const EdgeInsets.only(
                                          left: 80,
                                          right: 80,
                                          top: 1,
                                          bottom: 3)),
                                  child: const Text(
                                    'Registration  Page',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Digital',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  child: Text(
                                    errorMessage,
                                    style: const TextStyle(
                                        color: Colors.redAccent),
                                  ),
                                ),
                                EmailCred(
                                    hint: 'Enter Email !',
                                    controller: email,
                                    obscureText: false),
                                const SizedBox(
                                  height: 5,
                                ),
                                PassCred(
                                    controller: password,
                                    hint: 'Enter Password!',
                                    obscureText: true),
                                Padding(
                                  padding: const EdgeInsets.only(left: 135.0),
                                  child: RegisterLoggingButton(
                                    description: 'Login Here !',
                                    href: '/LoginPage',
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (_mykey.currentState!.validate()) {
                                      _auth.registerWithEmail(email.text.trim(),
                                          password.text.trim());
                                      setState(() {
                                        if (_auth.error) {
                                          errorMessage =
                                              'Please check credentials ( Account Does Exist ).';
                                        }
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightBlueAccent,
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 5,
                                          bottom: 8)),
                                  child: const Text(
                                    'Register !',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Digital',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  const Positioned(
                      left: 560,
                      top: 5,
                      child: RoundButton(
                          myIcon: Icons.exit_to_app, href: '/StartPage' , couleur: Color.fromRGBO(255, 210, 23, 5),))
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
