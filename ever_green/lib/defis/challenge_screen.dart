


import 'package:flutter/material.dart';
import 'package:sorttrash/BackEnd/ChallengesLocalDataBase/local_challenges.dart';
import 'package:sorttrash/button.dart';
import 'package:sorttrash/defis/show_challenge_screen.dart';

import 'challenge_mangement.dart';
import 'key_container.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  final ChallengeManagement challengeManagement = ChallengeManagement();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                 Container(
                   width: 80,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                   child: Row(
                     children:  [
                       const SizedBox(width: 5,),
                       Container(
                         height: 22,
                         width: 30,
                         decoration: const BoxDecoration(
                             image: DecorationImage( image: AssetImage('assets/images/gold_key.png'))
                         ),
                       ),
                       const SizedBox(width: 10,),
                       const Text('01', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Digital', color: sm1 ),)
                     ],
                   ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width - 240,),
                const RoundButton(href: '/', myIcon: Icons.home_filled, couleur: Colors.greenAccent, shadowColor: Colors.greenAccent,),
                const SizedBox(width: 5,),
                const RoundButton(href: '/', myIcon:  Icons.star, couleur: Colors.yellow, shadowColor:  Colors.yellowAccent,),
                const SizedBox(width: 5,),
                const RoundButton(href: '/', myIcon: Icons.settings, couleur: Colors.yellow, shadowColor: Colors.yellowAccent,),
                const SizedBox(width: 10,),
              ],
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                width:  8*0.12*MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio:2.7,
                  child: GridView.count(
                    crossAxisCount: 8,
                    children: [
                      for (int i = 0;
                      i < 24;
                      i++)
                        InkWell(
                             onTap: (){
                               Navigator.of(context).push(
                                 MaterialPageRoute(builder: (context) =>  ShowChallenge(challengeInformation: globalchallengesInformationsList[i]) )
                               );
                             }
                            ,child: challengeManagement.challengesList[i])
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
