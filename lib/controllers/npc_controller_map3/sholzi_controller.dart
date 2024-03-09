import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class SholziController extends GetxController implements NPCInterface {
  @override
  double get posX => .72 * Get.height;
  @override
  double get posY => .115 * Get.width;
  @override
  String get assetPath => AppAssets.sholzi;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Sholzi: ";
  List<String> dialogues = [
    "ayaaao",
    "ssab",
    "ac",
  ];

  List<List<double>> activeLocation = [
    [0.68, 0.76],
    [0.09, 0.14],
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
