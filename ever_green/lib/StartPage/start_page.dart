import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/StartPage/settings.dart';
import 'package:sorttrash/StartPage/start_page_button.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  double _value = 4;
  bool isSignedIn = false;
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    if (user != null) {
      if (!user!.emailVerified) {
        setState(() {
          user!.delete();
          FirebaseAuth.instance.signOut();

        });
      } else {
        setState(() {
          isSignedIn = true;
        });
      }
      super.initState();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(217, 217, 217, 0.5),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    ' Ever',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Digital',
                      color: Colors.white,
                      fontSize: 50,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(5.0, 1.0),
                          blurRadius: 5.0,
                          color: Colors.greenAccent,
                        ),
                        Shadow(
                          offset: Offset(5.0, 1.0),
                          blurRadius: 5.0,
                          color: Colors.greenAccent,
                        ),
                      ],
                    ),
                  ),
                  //   SilderMusic( value: _value,),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      ' Green',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Digital',
                        color: Colors.white,
                        fontSize: 70,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(5.0, 1.0),
                            blurRadius: 5.0,
                            color: Colors.greenAccent,
                          ),
                          Shadow(
                            offset: Offset(5.0, 1.0),
                            blurRadius: 5.0,
                            color: Colors.greenAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: SizedBox(
                      width: 150,
                      height: 90,
                      child: Stack(
                        children: [
                          const AnonButton(),
                          Positioned(
                            left: 100,
                            bottom: 20,
                            child: isSignedIn ?
                                  RoundButtonSettingsWhileLogged(
                                      myIcon: Icons.settings, value: _value)
                               : RoundButtonSettings(
                                      myIcon: Icons.settings, value: _value)

                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
