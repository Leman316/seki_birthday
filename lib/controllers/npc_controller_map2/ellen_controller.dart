import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class EllenController extends GetxController implements NPCInterface {
  @override
  double get posX => .43 * Get.height;
  @override
  double get posY => .275 * Get.width;
  @override
  String get assetPath => AppAssets.ellen;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Ellen: ";
  List<String> dialogues = [
    "ayo",
    "ab",
    "ac",
  ];

  List<List<double>> activeLocation = [
    [0.40, 0.46],
    [0.25, 0.30],
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
