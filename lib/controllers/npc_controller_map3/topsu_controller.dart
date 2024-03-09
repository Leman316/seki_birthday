import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class TopsuController extends GetxController implements NPCInterface {
  @override
  double get posX => .28 * Get.height;
  @override
  double get posY => .555 * Get.width;
  @override
  String get assetPath => AppAssets.topsu;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Topsu: ";
  List<String> dialogues = [
    "ayaaao",
    "ssab",
    "ac",
  ];

  List<List<double>> activeLocation = [
    [0.24, 0.32],
    [0.52, 0.58],
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
