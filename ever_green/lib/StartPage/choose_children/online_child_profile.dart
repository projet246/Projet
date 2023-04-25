
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/player_box.dart';

import '../../BackEnd/PlayerProgress/player.dart';
import '../../button.dart';

class OnlineProfilesSelection extends StatefulWidget {
  const OnlineProfilesSelection({Key? key}) : super(key: key);

  @override
  State<OnlineProfilesSelection> createState() => _OnlineProfilesSelection();
}

class _OnlineProfilesSelection extends State<OnlineProfilesSelection> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      await getProgress();
      setState(() {
        playersOnline = onlineProgress.returnPlayers();
      });
    });
  }
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: user == null
          ? Center(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Icon(
                      Icons.wifi_off_sharp,
                      color: Colors.black54,
                      size: 100,
                    ),
                    Text(
                      'Please Sign IN',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.redAccent,
                          fontFamily: 'Digital'),
                    )
                  ],
                ),
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg-image2.png'),
                    fit: BoxFit.fill),
              ),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Center(
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
                                ...playersOnline.map((e) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          onlineGlobalChildKey = e.childID;
                                          globalChildKey = -1;
                                          try {
                                            onlineProgress.setParent(
                                                onlineParentBox.get(user!.uid));
                                            onlineParentBox.put(
                                                onlineProgress.getUID(),
                                                onlineProgress.returnParent());
                                            onlineProgress
                                                .returnParent()
                                                .updateData(
                                                    onlineProgress.getUID());
                                          } catch (e) {
                                            print(e);
                                          }
                                          FloatingSnackBar(
                                            message:
                                                '🐧 : Online Profile Number : $onlineGlobalChildKey Selected. \n⛔️ : The Offline Profile is Unselected.',
                                            context: context,
                                            textColor: Colors.black,
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Digital',
                                                fontSize: 16),
                                            duration: const Duration(
                                                milliseconds: 4000),
                                            backgroundColor: Colors.indigo,
                                          );
                                        });
                                      },
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.child_care,
                                        ),
                                        title: Text(
                                            'Childs Name: ${e.childsName}',
                                            style: const TextStyle(
                                                fontFamily: 'Digital')),
                                        subtitle: Text(
                                            'ID : ${e.childID} \nScore : ${e.score} \nChildUID : ${e.childGlobalUID}  \nLast Time Played : ${e.lastTimeToJoin}',
                                            style: const TextStyle(
                                                fontFamily: 'Digital')),
                                        trailing: InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  String childName = '';
                                                  int? childAge;
                                                  return SingleChildScrollView(
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          'Enter Child Information',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Digital')),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          TextFormField(
                                                            decoration:
                                                                const InputDecoration(
                                                                    labelText:
                                                                        'Name'),
                                                            onChanged:
                                                                (value) =>
                                                                    childName =
                                                                        value,
                                                          ),
                                                          TextFormField(
                                                            decoration:
                                                                const InputDecoration(
                                                                    labelText:
                                                                        'Age'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            onChanged: (value) =>
                                                                childAge =
                                                                    int.tryParse(
                                                                            value) ??
                                                                        0,
                                                          ),
                                                        ],
                                                      ),
                                                      actions: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              onlineProgress
                                                                  .updateElementProgress(
                                                                      e,
                                                                      childName,
                                                                      childAge!);
                                                              playersOnline =
                                                                  onlineProgress
                                                                      .returnPlayers();
                                                              onlineParentBox.put(
                                                                  onlineProgress
                                                                      .getUID(),
                                                                  onlineProgress
                                                                      .returnParent());
                                                              onlineProgress
                                                                  .returnParent()
                                                                  .updateData(
                                                                      onlineProgress
                                                                          .getUID());
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            'Save',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Digital'),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            onlineProgress.setParent(
                                                                onlineParentBox
                                                                    .get(user!
                                                                        .uid));
                                                            setState(() {
                                                              onlineProgress
                                                                  .deleteElementProgress(
                                                                      e);
                                                              playersOnline =
                                                                  onlineProgress
                                                                      .returnPlayers();
                                                              onlineProgress
                                                                  .returnParent()
                                                                  .updateData(
                                                                      onlineProgress
                                                                          .getUID());
                                                            });
                                                            onlineParentBox.put(
                                                                onlineProgress
                                                                    .getUID(),
                                                                onlineProgress
                                                                    .returnParent());
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            'Delete',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Digital'),
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
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const RoundButton(
                            myIcon: Icons.home,
                            href: '/StartPage',
                            couleur: Colors.greenAccent,
                          ),
                        const SizedBox(height: 50,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff14ffe9),
                                side: const BorderSide(
                                    width: 3, color: Colors.white),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10)),
                            onPressed: () {
                              if (onlineGlobalChildKey != -1) {
                                onlineProgress.setChild(
                                    onlineGlobalChildKey,
                                    PlayerProgress(
                                        onlineProgress
                                            .returnParent()
                                            .children[onlineGlobalChildKey]
                                            .score,
                                        onlineProgress
                                            .returnParent()
                                            .children[onlineGlobalChildKey]
                                            .gamesData,
                                        DateTime.now(),
                                        onlineProgress
                                            .returnParent()
                                            .children[onlineGlobalChildKey]
                                            .childID,
                                        onlineProgress
                                            .returnParent()
                                            .children[onlineGlobalChildKey]
                                            .childsName,
                                        onlineProgress
                                            .returnParent()
                                            .children[onlineGlobalChildKey]
                                            .childGlobalUID

                                    ));
                                onlineParentBox.put(onlineProgress.getUID(),
                                    onlineProgress.returnParent());
                                onlineProgress
                                    .returnParent()
                                    .updateData(onlineProgress.getUID());
                                Navigator.popAndPushNamed(context, '/');
                              } else {
                                FloatingSnackBar(
                                  message:
                                      '📢 : Please Choose A Child Profile! ',
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
                              'Play !',
                              style: TextStyle(
                                fontFamily: 'Digital',
                              ),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff14ffe9),
                                side: const BorderSide(
                                    width: 3, color: Colors.white),
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
                                  int? childAge;
                                  return SingleChildScrollView(
                                    child: AlertDialog(
                                      title:
                                          const Text('Enter Child Information'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                              decoration: const InputDecoration(
                                                  labelText: 'Name'),
                                              onChanged: (value) =>
                                                  childName = value),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                                labelText: 'Age'),
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              if (int.tryParse(value) != null) {
                                                childAge = int.tryParse(value);
                                              } else {
                                                childAge = 0;
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(0xff14ffe9),
                                              side: const BorderSide(
                                                  width: 3, color: Colors.white),
                                              elevation: 1,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(0)),
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 10, bottom: 10)),
                                          onPressed: () {
                                            setState(() {
                                              onlineProgress.addElementProgress(
                                                  childName, childAge!);
                                              onlineParentBox.put(
                                                  onlineProgress.getUID(),
                                                  onlineProgress
                                                      .returnParent());
                                              playersOnline = onlineProgress
                                                  .returnPlayers();
                                              onlineProgress
                                                  .returnParent()
                                                  .updateData(
                                                      onlineProgress.getUID());
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

