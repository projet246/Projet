
class Piece {
  final String imageName;
  final int id;
  bool isInCorrectPosition = false;
  Piece({
    required this.imageName,
    required this.id,
  });
}

final puzzleLevel1Array = List.generate(16, (index) => Piece(imageName: "assets/images/puzzle/level1/$index.jpg", id: index + 1));
