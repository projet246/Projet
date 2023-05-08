import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';
import '../player_box.dart';
import 'key_container.dart';

class ShowChallenge extends StatelessWidget {

  ShowChallenge({Key? key, required this.challengeInformation})
      : super(key: key);
  final String challengeInformation;
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg-image2.png'),
                fit: BoxFit.fill),
          ),
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 0.6*MediaQuery.of(context).size.height,
                width: 0.34*MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
            ),

            Center(
              child: Container(
                height: 0.52*MediaQuery.of(context).size.height,
                width: 0.3*MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Container(
                      width: 0.26*MediaQuery.of(context).size.width,
                      height:0.07*MediaQuery.of(context).size.height ,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255,221,80, 1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.black54)
                      ),
                      child: const Center(child: Text('Challenge', style: TextStyle(color: Colors.white, fontFamily: 'Digital', fontSize: 18),),),
                    ),
                    const SizedBox(height: 20,),
                    Center(child : Text( challengeInformation,textAlign: TextAlign.center, style: const TextStyle( fontSize: 18, fontFamily: 'Digital',color: sm1, ),))
                  ],
                ),
              ),
            ),
            const Positioned(left : 487, top: 78,child: RoundButton(myIcon: Icons.exit_to_app, href: '/', couleur: Color.fromRGBO(255,221,80, 1), shadowColor: Colors.transparent,)),
            Positioned(
                left: 340,
                top: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: sm1,
                        side: const BorderSide(width: 3, color: Colors.white),
                        elevation: 0,
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 10)),
                    onPressed: (){
                  playerProgress.lastChallengeDate = DateTime.now();
                  try {
                    if (currentProfileIndex == 1) {
                      offlineProgress.setChild(globalChildKey, playerProgress);
                      if (parentBox.isEmpty) {
                        parentBox.add(offlineProgress);
                      }else{
                        parentBox.putAt(0, offlineProgress.returnParent());
                      }
                    } else {
                      onlineProgress.setChild(onlineGlobalChildKey, playerProgress);
                      onlineParentBox.put(user!.uid, onlineProgress.returnParent());
                      onlineProgress.returnParent().updateData(onlineProgress.getUID());
                    }
                  } catch (e) {
                    print(e);
                  }
                }, child: Text('Done')))
          ],
        ),
      ),
    );
  }
}

