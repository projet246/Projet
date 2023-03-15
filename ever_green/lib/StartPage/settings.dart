import 'package:flutter/material.dart';
import 'package:sorttrash/StartPage/Silder.dart';
import 'package:sorttrash/button.dart';

class SettingsStartPage extends StatefulWidget {
  SettingsStartPage({Key? key, required value}) {
    this._value = value;
  }
  double _value = 0;
  @override
  State<SettingsStartPage> createState() => _SettingsStartPageState();
}

class _SettingsStartPageState extends State<SettingsStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class RoundButtonSettings extends StatelessWidget {
  final IconData myIcon;
  double value = 5;
  RoundButtonSettings({super.key, required this.myIcon, required this.value});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
               // contentPadding: const EdgeInsets.all(20.0),
                  backgroundColor: Colors.transparent,
                  insetPadding:   EdgeInsets.all(10),
                  content: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 500,
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.transparent,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 300,
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white38,
                            ),
                          ),
                        ),
                         Positioned(
                           top: 0,
                            left: 100,
                            child: Center(
                              child: Container(
                                width: 300,
                                height: 265,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.greenAccent,
                                            side: const BorderSide(
                                                width: 3, color: Colors.black38),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            padding: const EdgeInsets.only(
                                                left: 80,
                                                right: 80,
                                                top: 1,
                                                bottom: 3)),
                                        child: const Text(
                                          'Settings',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Digital',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Text(
                                        'Music',
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 210, 23, 5),
                                          fontSize: 20,
                                          fontFamily: 'Digital',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SilderMusic(
                                        value: value,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text(
                                        'Sound',
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 210, 23, 5),
                                          fontSize: 20,
                                          fontFamily: 'Digital',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SilderMusic(
                                        value: value,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.lightBlueAccent,
                                            padding: const EdgeInsets.only(
                                                left: 40,
                                                right: 40,
                                                top: 5,
                                                bottom: 8)),
                                        child: const Text(
                                          'Register',
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
                              ),
                            ),
                          ),

                        const Positioned(
                            left: 370,
                            top: 0,
                            child: RoundButton(myIcon : Icons.exit_to_app, href: '/StartPage'))
                      ],
                    ),
                  ));
            });
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 210, 23, 5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Icon(
                myIcon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
