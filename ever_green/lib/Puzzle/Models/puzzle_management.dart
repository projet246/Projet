

import 'package:sorttrash/Puzzle/main_puzzle.dart';
import 'Objects.dart';
import 'TrashCans.dart';

class PuzzleManagement{

  late PuzzleLevel level1 = PuzzleLevel(
    isLocked: false,
    arrayOfPuzzlePieces: puzzleLevel1Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 4,
    timeCount: 100,
    changeBooleanStatus: level2.setIsLocked, imageName: 'assets/images/puzzle_level1.jpg',
  );
  late PuzzleLevel level2 = PuzzleLevel(
    isLocked: true,
    arrayOfPuzzlePieces: puzzleLevel1Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 4,
    timeCount: 100,
    changeBooleanStatus: level3.setIsLocked, imageName: 'assets/images/puzzle_level1.jpg',
  );
  late PuzzleLevel level3 = PuzzleLevel(
    isLocked: true,
    arrayOfPuzzlePieces: puzzleLevel1Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 4,
    timeCount: 100,
    changeBooleanStatus: level4.setIsLocked, imageName: 'assets/images/puzzle_level1.jpg',
  );
  late PuzzleLevel level4 = PuzzleLevel(
    isLocked: true,
    arrayOfPuzzlePieces: puzzleLevel1Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 4,
    timeCount: 100,
    changeBooleanStatus: level5.setIsLocked, imageName: 'assets/images/puzzle_level1.jpg',
  );
  late PuzzleLevel level5 = PuzzleLevel(
    isLocked: true,
    arrayOfPuzzlePieces: puzzleLevel1Array,
    arrayOfSquares: puzzleArray,
    matrixSSize: 4,
    timeCount: 100,
    changeBooleanStatus: decoyMethod, imageName: 'assets/images/puzzle_level1.jpg',
  );
  bool decoyMethod(bool te) {
    return false;
  }
  late List<PuzzleLevel> levelsContainer = [level1, level2, level3, level4, level5];
}