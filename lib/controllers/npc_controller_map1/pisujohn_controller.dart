import 'package:get/get.dart';
import '/models/npc_interface.dart';

import '../../consts/consts.dart';
import '../character_controller.dart';

class PisuJohnController extends GetxController implements NPCInterface {
  @override
  double get posX => .26 * Get.height;
  @override
  double get posY => .605 * Get.width;
  @override
  String get assetPath => AppAssets.john;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "PisuJohn: ";
  List<String> dialogues = [
    "ayo",
    "ab",
    "ac",
  ];

  List<List<double>> activeLocation = [
    [0.23, 0.29],
    [0.58, 0.63],
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
