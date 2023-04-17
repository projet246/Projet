import 'level.dart';

class Management {
  late Level level1 =
      Level(changeBooleanStatus: level2.setIsLocked, isLocked: false);
  late Level level2 =
      Level(changeBooleanStatus: level3.setIsLocked, isLocked: true);
  late Level level3 =
      Level(changeBooleanStatus: level4.setIsLocked, isLocked: true);
  late Level level4 =
      Level(changeBooleanStatus: level5.setIsLocked, isLocked: true);
  late Level level5 = Level(changeBooleanStatus: decoyMethod, isLocked: true);
  bool decoyMethod(bool te) {
    return false;
  }

  late List<Level> QuizContainer = [level1, level2, level3, level4, level5];
}
