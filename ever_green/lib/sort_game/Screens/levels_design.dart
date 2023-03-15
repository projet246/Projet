import 'package:flutter/material.dart';
import '../../button.dart';
import '../Levels/Level.dart';
import '../Levels/preload_screen.dart';








class LevelDesign extends StatelessWidget {
  //la classe qui contient le frame de bg_card (dans le UI)
  final String Photo; //pour insere la photo;
  final String? title; //pour rajouter de contenu dans le frame
  final Color coleur1;
  final Color coleur2;
  final Level widget;
  final double hei; //for double
  final double wid; //for width of image
  const LevelDesign({
    super.key,
    required this.title,
    required this.coleur1,
    required this.coleur2,
    required this.widget,
    required this.Photo,
    required this.hei,
    required this.wid,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if ( !widget.returnIsLocked() ){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FlameGameScreen(level: widget )),
          );
        }
      },
      child: SizedBox(
        height: 250.0,
        width: 180.0,
        child: Stack(children: [
          Container(
            //le grand carré vert
            height: 230.0,
            width: 180.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27.0),
              color: this.coleur2,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Stack(
              children: [
                Container(
                  //le deuxieme carré vert
                  height: 225.0,
                  width: 180.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27.0),
                    color: this.coleur2,
                    boxShadow: const [
                      //le shadow du box vert
                      BoxShadow(
                        color: Color.fromARGB(255, 70, 67, 67),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 3.0,
                  left: 5.0,
                  right: 5.0,
                  child: Container(
                    //ke troisieme carré blanc
                    height: 210.0,
                    width: 170.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27.0),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/${this.Photo}',
                            height: this.hei,
                            width: this.wid,
                          ),
                        ),
                      ],
                    ), //le text se rajoute ici
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            //placer le boutton de
            top: 200.0,
            left: 47.0,
            // child: RectangleButton(couleur2: Color.fromARGB(255, 102, 235, 0) , couleur1: Color.fromARGB(255, 79, 195, 7) ,text: this.title, ),
            child: RectangleButton(
              couleur2: this.coleur2,
              couleur1: this.coleur1,
              text: this.title,
            ),
          ),
        ]),
      ),
    );
  }
}








//
//
// class LevelDesign extends StatefulWidget {
//   late Color _color1;
//   late Level _level;
//   late String _name;
//   LevelDesign(
//       {super.key,
//       required Color color1,
//       required String name,
//       required Level level}) {
//     _color1 = color1;
//     _name = name;
//     _level = level;
//   }
//
//   String id = 'LevelDesign';
//   @override
//   State<LevelDesign> createState() => _LevelDesignState();
// }
//
// class _LevelDesignState extends State<LevelDesign>
//     with TickerProviderStateMixin {
//   double scale = 1;
//   @override
//   Widget build(BuildContext context) {
//     Widget _buildIcon() {
//       if (widget._level.returnIsLocked()) {
//         return const Icon(Icons.lock);
//       }
//       return const Icon(Icons.recycling);
//     }
//     return GestureDetector(
//       onTapCancel: () {
//         setState(() {
//           scale = 1;
//         });
//       },
//       onTapUp: (val) {
//         setState(() {
//           if (!widget._level.returnIsLocked()) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => FlameGameScreen(level: widget._level)),
//             );
//           }
//           scale = 1;
//         });
//       },
//       onTapDown: (val) async {
//         setState(() {
//           scale = 0.9;
//         });
//       },
//       child: AnimatedContainer(
//         transform: Matrix4.identity()..scale(scale),
//         duration: const Duration(milliseconds: 160),
//         width: 200,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: widget._color1,
//           border: Border.all(
//             color: Colors.white,
//             width: 5.0,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(25.0),
//           child: FittedBox(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   widget._name,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22),
//                 ),
//                 _buildIcon(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
