import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../player_box.dart';


class AnonButton extends StatefulWidget {
  const AnonButton({Key? key, required this.href, required this.color}) : super(key: key);
  final String href;
  final Color color ;
  @override
  State<AnonButton> createState() => _AnonButtonState();
}

class _AnonButtonState extends State<AnonButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ()   async {
          getProgress();
          Navigator.pushNamed(context, widget.href);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
            side: const BorderSide(width: 3, color: Colors.white),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 10)),
        child: const Text(
          'Play',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Digital',
          ),
        ));
  }
}

Future loadProgress( )async{
  final User? user = FirebaseAuth.instance.currentUser;
  bool _result = await InternetConnectionChecker().hasConnection;
  if ( _result ){
    onlineProgress.setParent(await onlineParent.fetchParentData(FirebaseAuth.instance.currentUser!.uid)) ;
    onlineProgress.setUID(user!.uid);
    onlineParentBox.put(user.uid, onlineProgress.returnParent());
    onlineProgress.setPlayers(onlineProgress.returnParent().children);
    playersOnline = onlineProgress.returnPlayers();
  }else{
    if (onlineParentBox.isNotEmpty && user != null) {
      if (onlineParentBox.containsKey(user.uid)) {
        onlineProgress.setUID(user.uid);
        onlineProgress.setParent(onlineParentBox.get(user.uid));
        onlineProgress.setPlayers(onlineProgress.returnParent().children);
        playersOnline = onlineProgress.returnPlayers();
      }
    }
  }
}

