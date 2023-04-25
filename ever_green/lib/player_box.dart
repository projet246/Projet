import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sorttrash/BackEnd/DataBaseService/local_data_base_service.dart';
import 'package:sorttrash/BackEnd/DataBaseService/online_data_base_service.dart';


import 'BackEnd/PlayerProgress/player.dart';


int globalChildKey = -1;
int onlineGlobalChildKey = -1;
late Box playerBox;
late Box parentBox;

int currentProfileIndex = 1;
List<PlayerProgress> offlineGlobalPlayers = [];
List<PlayerProgress> playersOnline = [];
late Box onlineParentBox;
DataBaseService offlineProgress = DataBaseService(offlineGlobalPlayers, offlineParent);
Parent offlineParent = Parent([], 0);
Parent onlineParent = Parent([], 0);
PlayerProgress playerProgress = offlineParent.children[globalChildKey];
OnlineDataBaseService onlineProgress = OnlineDataBaseService(playersOnline, onlineParent, decoyUID);
String decoyUID = '';
double globalVolumeMusicSettings = 1;
late  AssetImage backgroundImage2 =  const AssetImage('assets/images/bg-image2.png');
bool isLoggedInGlobalKey = false;
Future getProgress() async {
  final User? user = FirebaseAuth.instance.currentUser;
  final result = await InternetConnectionChecker().hasConnection;
  if ( result ){
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