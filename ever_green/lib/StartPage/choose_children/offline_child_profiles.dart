import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';
import 'package:sorttrash/player_box.dart';
import 'package:uuid/uuid.dart';
import '../../BackEnd/PlayerProgress/player.dart';

class OfflineProfilesSelection extends StatefulWidget {
  const OfflineProfilesSelection({Key? key}) : super(key: key);

  @override
  State<OfflineProfilesSelection> createState() =>
      _OfflineProfilesSelectionState();
}

class _OfflineProfilesSelectionState extends State<OfflineProfilesSelection> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    if (parentBox.isNotEmpty) {
      Parent test = Parent([], 0, const Uuid().v4().toString());
      test = parentBox.getAt(0);
      offlineProgress.setParent(test);
      offlineProgress.setPlayers(offlineProgress.returnParent().children);
      setState(() {
        offlineGlobalPlayers = test.children;
      });
    } else {
      offlineProgress.setParent(Parent([], 0, const Uuid().v4().toString()));
      parentBox.add(offlineProgress.returnParent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.cover),
        ),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 10, bottom: 10),
                child: Container(
                  height: 340,
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...offlineGlobalPlayers.map((e) => InkWell(
                              onTap: () {
                                setState(() {
                                  globalChildKey = e.childID;
                                  onlineGlobalChildKey = -1;
                                  offlineProgress.setParent(parentBox.get(0));
                                  playerProgress = offlineProgress
                                      .returnParent()
                                      .children[globalChildKey];
                                  FloatingSnackBar(
                                    message:
                                        '🐧 : Offline Profile Number : $globalChildKey Selected. \n⛔ : Online Profile is Unselected.',
                                    context: context,
                                    textColor: Colors.black,
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Digital',
                                        fontSize: 16),
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    backgroundColor: Colors.indigo,
                                  );
                                });
                              },
                              child: ListTile(
                                leading: const Icon(
                                  Icons.child_care,
                                ),
                                title: Text('Childs Name: ${e.childsName}',
                                    style:
                                        const TextStyle(fontFamily: 'Digital')),
                                subtitle: Text(
                                    'ID : ${e.childID} \nLast Time Played : ${e.lastTimeToJoin}',
                                    style:
                                        const TextStyle(fontFamily: 'Digital')),
                                trailing: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          String childName = '';
                                          int childAge = 0;
                                          return SingleChildScrollView(
                                            child: AlertDialog(
                                              title: const Text(
                                                  'Enter Child Information',
                                                  style: TextStyle(
                                                      fontFamily: 'Digital')),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextFormField(
                                                      maxLength: 15,
                                                      decoration:
                                                          const InputDecoration(
                                                              labelText:
                                                                  'Name'),
                                                      onChanged: (value) =>
                                                          childName = value),
                                                  TextFormField(
                                                    validator: (value) => value ==
                                                                null ||
                                                            value.length > 2 ||
                                                            value.isEmpty
                                                        ? 'Enter 2- char password'
                                                        : null,
                                                    maxLength: 2,
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText: 'Age'),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (value) =>
                                                        childAge = int.tryParse(
                                                                value) ??
                                                            0,
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      offlineProgress
                                                          .updateElementProgress(
                                                              e,
                                                              childName,
                                                              childAge);
                                                      offlineGlobalPlayers =
                                                          offlineProgress
                                                              .returnPlayers();
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Save',
                                                    style: TextStyle(
                                                        fontFamily: 'Digital'),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    offlineProgress.setParent(
                                                        parentBox.getAt(0));
                                                    setState(() {
                                                      offlineProgress
                                                          .deleteElementProgress(
                                                              e);
                                                      offlineGlobalPlayers =
                                                          offlineProgress
                                                              .returnPlayers();
                                                      globalChildKey = -1;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        fontFamily: 'Digital'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: const Icon(Icons.edit)),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: RoundButton(
                      myIcon: Icons.home,
                      href: '/StartPage',
                      couleur: Colors.greenAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff14ffe9),
                          side: const BorderSide(width: 3, color: Colors.white),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10)),
                      onPressed: () async {
                        if (globalChildKey != -1) {
                          offlineProgress.setChild(
                              globalChildKey,
                              PlayerProgress(
                                  offlineProgress
                                      .returnParent()
                                      .children[globalChildKey]
                                      .score,
                                  offlineProgress
                                      .returnParent()
                                      .children[globalChildKey]
                                      .gamesData,
                                  DateTime.now(),
                                  offlineProgress
                                      .returnParent()
                                      .children[globalChildKey]
                                      .childID,
                                  offlineProgress
                                      .returnParent()
                                      .children[globalChildKey]
                                      .childsName,
                                  offlineProgress
                                      .returnParent()
                                      .children[globalChildKey]
                                      .childGlobalUID,
                                  offlineProgress
                                      .returnParent()
                                      .children[globalChildKey]
                                      .avatarProfileName));
                          parentBox.putAt(0, offlineProgress.returnParent());
                          await Navigator.popAndPushNamed(context, '/');
                        } else {
                          FloatingSnackBar(
                            message: '📢 : Please Choose A Child Profile! ',
                            context: context,
                            textColor: Colors.black,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Digital',
                                fontSize: 16),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: Colors.redAccent,
                          );
                        }
                      },
                      child: const Text(
                        'Play',
                        style: TextStyle(
                          fontFamily: 'Digital',
                        ),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff14ffe9),
                          side: const BorderSide(width: 3, color: Colors.white),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10)),
                      onPressed: () {
                        if (parentBox.isNotEmpty) {
                          if (user != null) {
                            setState(() {
                              onlineProgress.appendDataAndSave(
                                  offlineProgress.returnParent());
                              playersOnline = onlineProgress.returnPlayers();
                              onlineProgress
                                  .returnParent()
                                  .updateData(onlineProgress.getUID());
                            });
                          } else {
                            FloatingSnackBar(
                              message: '📢 : Please Log in Or Register ',
                              context: context,
                              textColor: Colors.black,
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Digital',
                                  fontSize: 16),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor: Colors.redAccent,
                            );
                          }
                        }
                      },
                      child: const Text('ONL/OFL')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff14ffe9),
                          side: const BorderSide(width: 3, color: Colors.white),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10)),
                      child: const Icon(Icons.add),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            String childName = '';
                            int childAge = 0;
                            return SingleChildScrollView(
                              child: AlertDialog(
                                title: const Text('Enter Child Information'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      maxLength: 15,
                                      decoration: const InputDecoration(
                                          labelText: 'Name'),
                                      onChanged: (value) => childName = value,
                                    ),
                                    TextFormField(
                                      validator: (value) => value == null ||
                                              value.length > 2 ||
                                              value.isEmpty
                                          ? 'Enter 2- char password'
                                          : null,
                                      maxLength: 2,
                                      decoration: const InputDecoration(
                                          labelText: 'Age'),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        if (int.tryParse(value) != null) {
                                          childAge = int.tryParse(value)!;
                                        } else {
                                          childAge = 0;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        offlineProgress.addElementProgress(
                                            childName, childAge);
                                        offlineGlobalPlayers =
                                            offlineProgress.returnPlayers();
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Save'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
