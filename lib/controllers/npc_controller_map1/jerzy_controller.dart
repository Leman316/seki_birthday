import 'package:get/get.dart';
import '/controllers/character_controller.dart';
import '/models/npc_interface.dart';

import '../../consts/consts.dart';

class JerzyController extends GetxController implements NPCInterface {
  @override
  double get posX => .43 * Get.height;
  @override
  double get posY => .315 * Get.width;
  @override
  String get assetPath => AppAssets.jerzy;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Jerzy: ";
  List<String> dialogues = [
    "a   oi  oi   oi",
    "ab   oi  oi   oi",
    "ac   oi  oi   oi",
  ];

  List<List<double>> activeLocation = [
    [0.39, 0.48],
    [0.29, 0.34],
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
