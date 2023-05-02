




import '../BackEnd/DataBaseService/local_data_base_service.dart';
import '../player_box.dart';
import 'key_container.dart';

class ChallengeManagement {

  DataBaseService dataBaseService = currentProfileIndex == 1? offlineProgress : onlineProgress;
  late List<KeyContainer> challengesList = List.generate(24, (index) =>  KeyContainer(state: true, text: '${index+1}',));
}