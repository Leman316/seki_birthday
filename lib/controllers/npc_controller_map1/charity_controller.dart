import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../character_controller.dart';
import '../../models/npc_interface.dart';

class CharityController extends GetxController implements NPCInterface {
  @override
  double get posX => .67 * Get.height;
  @override
  double get posY => .555 * Get.width;
  @override
  String get assetPath => AppAssets.charity;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "HighCharity: ";
  List<String> dialogues = [
    "avas",
    "ab",
    "ac",
  ];

  List<List<double>> activeLocation = [
    [0.64, 0.70],
    [0.53, 0.58],
  ];

  showDialogue(double xPosition, double yPosition) {
    if ((xPosition > activeLocation.first.first && xPosition <= activeLocation.first.last) &&
        (yPosition > activeLocation.last.first && yPosition <= activeLocation.last.last)) {
      CharacterController player = Get.find();
      player.showDialogue.value = true;
      player.dialogueText.value = characterName + dialogues[currentDialoguePosition.value % dialogues.length];
      currentDialoguePosition += 1;
    }
  }
}
