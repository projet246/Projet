import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../Models/Objects.dart';
import '../Models/TrashCans.dart';
class Level extends StatefulWidget {
  late Function(bool) _changeBooleanStatus;
  Level(
      {super.key,
      required List<Trash> arrayOfTrash,
      required List<TrashCan> arrayOfTrashCans,
      required Function(bool) changeBooleanStatus,
      required bool isLocked}) {
    _arrayOfTrash = arrayOfTrash;
    _arrayOfTrashCans = arrayOfTrashCans;
    _changeBooleanStatus = changeBooleanStatus;
    _isLocked = isLocked;
    _copyOfArrayOfTrash = arrayOfTrash.toList();
  }
  bool _isLocked = false;
  bool _isFinished = false;
  late List<Trash> _arrayOfTrash;
  late List<Trash> _copyOfArrayOfTrash;
  late List<TrashCan> _arrayOfTrashCans;

  bool returnIsLocked() {
    return _isLocked;
  }

  bool returnIsFinished() {
    return _isFinished;
  }
  void setIsLocked(bool isUnlockde) {
    _isLocked = isUnlockde;
  }

  void setIsFinished(bool isFinished) {
    _isFinished = isFinished;
  }

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  final _player = AudioPlayer();
  final _audio = AudioCache();
  late double screenHeight = MediaQuery.of(context).size.height;
  late double screenWidth = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg-image.png'), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
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
                            setState(() {
                              widget._arrayOfTrash =
                                  widget._copyOfArrayOfTrash.toList();
                              Navigator.popAndPushNamed(context, '/Niveaux')   ;
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
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget._arrayOfTrash =
                                  widget._copyOfArrayOfTrash.toList();
                            });
                            Navigator.pop(context);
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
                          child: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff14ffe9),
                side: const BorderSide(width: 3, color: Colors.black),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10)),
            child: const Icon(Icons.settings),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDragInterface(),
            ],
          ),

          showTrashCans(context),
          
        ],
      ),
    );
  }

  Widget showTrashCans(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget._arrayOfTrashCans
              .map((trashCan) => showTrashCan(context, trashCan: trashCan))
              .toList(),
        ),
      ),
    );
  }
  @override
  void initState() {
    _audio.load('music/correct.mp3');
    _audio.load('music/wrong.mp3');
    super.initState();
  }
  Widget showTrashCan(BuildContext context, {required TrashCan trashCan}) {
    return DragTarget<Trash>(
      builder: (context, candidateData, rejectedData) => Center(
        child: Container(
          height: 200,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(trashCan.imageName), fit: BoxFit.fill),
            color: Colors.transparent,
          ),
        ),
      ),
      onWillAccept: (data) => true,
      onAccept: (data) {
        if (trashCan.trashToGoThrough.contains(data.type)) {
          _player.play(AssetSource('music/correct.mp3'));
          _player.stop();
          if (widget._arrayOfTrash.length == 1) {
            setState(() {
              widget._arrayOfTrash = widget._copyOfArrayOfTrash.toList();
              widget.setIsFinished(true);
              widget._changeBooleanStatus(false);
              Navigator.pop(context);
              Navigator.pushNamed(context, '/Niveaux');
            });
          }
          setState(() {
            widget._arrayOfTrash.removeWhere((trash) => trash.id == data.id);
          });
        } else {
          _player.play(AssetSource('music/wrong.mp3'));
          _player.stop();
        }
      },
    );
  }

  Widget buildDragInterface() {
    widget._arrayOfTrash.shuffle();
    return Container(
      width: 400,
      margin: EdgeInsets.only(left: 0.20*screenWidth, right: 0.20*screenWidth),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget._arrayOfTrash
              .map((trash) => DraggableTrash(trash: trash))
              .toList(),
        ),
      ),
    );
  }
}

class DraggableTrash extends StatelessWidget {

  final Trash trash;
  const DraggableTrash({
    Key? key,
    required this.trash,
  }) : super(key: key);
  static double size = 50;
  @override
  Widget build(BuildContext context) => Draggable<Trash>(
        data: trash,
        feedback: image(),
        childWhenDragging: Container(height: size),
        child: image(),
      );

  Widget image() => Container(

        height: size,
        width: size,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.transparent,
        ),
        child: Image.asset(trash.imageName),
      );
}
