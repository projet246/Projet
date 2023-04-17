import '../Models/Objects.dart';
import '../Models/TrashCans.dart';
import 'Level.dart';

class LevelManagement {
  late Level level1 = Level(
    isLocked: false, 
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: level2.setIsLocked,
  );
  late Level level2 = Level(
    isLocked: true,
    arrayOfTrash: trashArray2,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: level3.setIsLocked,
  );

  late Level level3 = Level(
    isLocked: true,
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: level4.setIsLocked,
  );

  late Level level4 = Level(
    isLocked: true,
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: level5.setIsLocked,
  );

  late Level level5 = Level(
    isLocked: true,
    arrayOfTrash: trashArray,
    arrayOfTrashCans: trashCansArray,
    changeBooleanStatus: decoyMethod,
  );
  bool decoyMethod(bool te) {
    return false;
  }

  late List<Level> levelsContainer = [level1, level2, level3, level4, level5];
}
