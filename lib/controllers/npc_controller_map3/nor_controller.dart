import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class NorController extends GetxController implements NPCInterface {
  @override
  double get posX => .34 * Get.height;
  @override
  double get posY => .245 * Get.width;
  @override
  String get assetPath => AppAssets.nor;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Nor: ";
  List<String> dialogues = [
    "ayo",
    "ssab",
    "ac",
  ];

  List<List<double>> activeLocation = [
    [0.30, 0.38],
    [0.21, 0.28],
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
