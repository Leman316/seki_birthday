import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class PasswordzController extends GetxController implements NPCInterface {
  @override
  double get posX => .40 * Get.height;
  @override
  double get posY => .535 * Get.width;
  @override
  String get assetPath => AppAssets.passwordz;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Passwordz: ";
  List<String> dialogues = [
    "Ivsa",
    "I really want Geni's Schlongy blongy in and around my face.",
    "acsads",
  ];

  List<List<double>> activeLocation = [
    [0.37, 0.43],
    [0.51, 0.56],
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
