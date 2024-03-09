import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class KittyController extends GetxController implements NPCInterface {
  @override
  double get posX => .30 * Get.height;
  @override
  double get posY => .205 * Get.width;
  @override
  String get assetPath => AppAssets.kitty;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Kitty: ";
  List<String> dialogues = [
    "aao",
    "ssab",
    "sssac",
  ];

  List<List<double>> activeLocation = [
    [0.26, 0.34],
    [0.18, 0.24],
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
