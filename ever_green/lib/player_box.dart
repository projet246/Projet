import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sorttrash/BackEnd/DataBaseService/local_data_base_service.dart';
import 'package:sorttrash/BackEnd/DataBaseService/online_data_base_service.dart';
import 'package:sorttrash/StartPage/choose_children/offline_child_profiles.dart';

import 'BackEnd/PlayerProgress/player.dart';
import 'StartPage/choose_children/online_child_profile.dart';

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
final globalStartPageScreensPlayerBox = [
  const OnlineProfilesSelection(),
  const OfflineProfilesSelection(),
  //  const LeaderBoard()
];