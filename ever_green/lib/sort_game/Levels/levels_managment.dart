import '../Models/Objects.dart';
import '../Models/TrashCans.dart';
import 'Level.dart';

class LevelManagement {
  static const int _MAXLEVELS = 5;
  late Level level1 = Level(
    isUnlocked: false,
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    backgroundImage: 'assets/images/back.jpg',
    changeBooleanStatus: level2.setIsLocked,
  );
  late Level level2 = Level(
    isUnlocked: true,
    arrayOfTrash: trashArray2,
    arrayOfTrashCans: trashCansArray,
    backgroundImage: 'assets/images/back.jpg',
    changeBooleanStatus: level3.setIsLocked,
  );

  late Level level3 = Level(
    isUnlocked: true,
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    backgroundImage: 'assets/images/back.jpg',
    changeBooleanStatus: level4.setIsLocked,
  );

  late Level level4 = Level(
    isUnlocked: true,
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    backgroundImage: 'assets/images/back.jpg',
    changeBooleanStatus: level5.setIsLocked,
  );

  late Level level5 = Level(
    isUnlocked: true,
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    backgroundImage: 'assets/images/back.jpg',
    changeBooleanStatus: test,
  );
  bool test( bool te){
    return false;
  }
  int _currentLevelIndex = 0;
  void setCurrentLevelIndex(int index) {
    _currentLevelIndex = index;
  }
}
