import 'package:sorttrash/player_box.dart';
import '../BackEnd/DataBaseService/local_data_base_service.dart';
import 'level.dart';

class Management {
  DataBaseService dataBaseService = currentProfileIndex == 1? offlineProgress : onlineProgress;
  late Level level1 =
      Level(changeBooleanStatus: level2.setIsLocked, isLocked: dataBaseService.returnLockedState(0,2));
  late Level level2 =
      Level(changeBooleanStatus: level3.setIsLocked, isLocked: dataBaseService.returnLockedState(1,2));
  late Level level3 =
      Level(changeBooleanStatus: level4.setIsLocked, isLocked: dataBaseService.returnLockedState(2,2));
  late Level level4 =
      Level(changeBooleanStatus: level5.setIsLocked, isLocked: dataBaseService.returnLockedState(3,3));
  late Level level5 = Level(changeBooleanStatus: decoyMethod, isLocked: dataBaseService.returnLockedState(4,3));
  bool decoyMethod(bool te) {
    return false;
  }
  late List<Level> QuizContainer = [level1, level2, level3, level4, level5];
}
