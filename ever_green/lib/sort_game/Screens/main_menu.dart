

import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';

import '../LearnPage/On_Broading_Page.dart';
import '../Levels/levels_managment.dart';
import 'levels_design.dart';

class MainMenu extends StatefulWidget {

  MainMenu({super.key, Key? key1});
  @override
  State<MainMenu> createState() => _MainMenuState();
}
class _MainMenuState extends State<MainMenu> {
  late int levelIndex = 1;
  double _currentValue = 0.5;
  void showSettingsMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: Colors.black87,
          backgroundColor: Colors.white54,
          title: const Center(
            child: Text(
              'Settings',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LearnPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff14ffe9),
                    side: const BorderSide(width: 3, color: Colors.black),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10)),
                child: const Icon(Icons.receipt_sharp),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacementNamed(context, '/');
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff14ffe9),
                    side: const BorderSide(
                        width: 3, color: Colors.black),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 10, bottom: 10)),
                child: const Icon(Icons.arrow_back),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save the settings and dismiss the dialog
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    late LevelManagement _levelsManagement  = LevelManagement();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/level1.jpg'), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {showSettingsMenu(context);},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 245, 53),
                      side: const BorderSide(width: 3, color: Colors.white),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(15)),
                  child:  const Text('🏆', style: TextStyle( fontSize: 20 ),),
                ),
                ElevatedButton(
                  onPressed: () {showSettingsMenu(context);},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 245, 53),
                      side: const BorderSide(width: 3, color: Colors.white),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(15)),
                  child: const Icon(Icons.settings),
                ),

              ],
            ),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      LevelDesign(
                        title: 'DEFIS',
                        coleur1: const Color.fromARGB(223, 202, 63, 172),
                        coleur2: const Color.fromARGB(255, 240, 71, 206),
                        Photo: "defis.png",
                        hei: 200.00,
                        wid: 200.0,
                        widget: _levelsManagement.level1,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      LevelDesign(
                        title: 'DEFIS',
                        coleur1: const Color.fromARGB(223, 202, 63, 172),
                        coleur2: const Color.fromARGB(255, 240, 71, 206),
                        Photo: "defis.png",
                        hei: 200.00,
                        wid: 200.0,
                        widget: _levelsManagement.level2,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      LevelDesign(
                        title: 'DEFIS',
                        coleur1: const Color.fromARGB(223, 202, 63, 172),
                        coleur2: const Color.fromARGB(255, 240, 71, 206),
                        Photo: "defis.png",
                        hei: 200.00,
                        wid: 200.0,
                        widget: _levelsManagement.level3,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      LevelDesign(
                        title: 'DEFIS',
                        coleur1: const Color.fromARGB(223, 202, 63, 172),
                        coleur2: const Color.fromARGB(255, 240, 71, 206),
                        Photo: "defis.png",
                        hei: 200.00,
                        wid: 200.0,
                        widget: _levelsManagement.level4,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
