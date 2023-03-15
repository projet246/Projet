enum TrashTypes {
  paperAndCardboard,
  glass,
  plastic,
  metal,
  eWaste,
  organicWaste,
  hazardousWaste
}

class Trash {
  final String imageName;
  final TrashTypes type;
  final int id;
  bool isInCorrectPosition = false;
  Trash({
    required this.imageName,
    required this.type,
    required this.id,
  });
}

final trashArray = [
  Trash(
    id: 1,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 2,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 3,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 4,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
  //*//
  Trash(
    id: 5,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 6,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 7,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 8,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
  //**//
  Trash(
    id: 9,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 10,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 11,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 12,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  )
];
final trashArray2 = [
  Trash(
    id: 1,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 2,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 3,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 4,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
//*//
  Trash(
    id: 5,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 6,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 7,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 8,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
//**//
  Trash(
    id: 9,
    imageName: "assets/images/plastic.png",
    type: TrashTypes.plastic,
  ),
  Trash(
    id: 10,
    imageName: "assets/images/ewaste.png",
    type: TrashTypes.eWaste,
  ),
  Trash(
    id: 11,
    imageName: "assets/images/organic.png",
    type: TrashTypes.organicWaste,
  ),
  Trash(
    id: 12,
    imageName: "assets/images/paper.png",
    type: TrashTypes.paperAndCardboard,
  ),
];
