import 'package:get/get.dart';
import '/controllers/character_controller.dart';
import '/models/npc_interface.dart';

import '../../consts/consts.dart';

class NatController extends GetxController implements NPCInterface {
  @override
  double get posX => .43 * Get.height;
  @override
  double get posY => .315 * Get.width;
  @override
  String get assetPath => AppAssets.jerzy;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Nat: ";
  List<String> dialogues = [
    "I eat pickles and pickle juice",
    "Ah, ah, ahhhh. They just keep dropping on my face. Stop! My face can't handle them.",
    "So, I want somewhere around this color spectrum, a little fanum tax on the top. No shorter than skibidi. Thank you!",
    "What is my little pony jar?",
    "Happy Birthday! I'm so grateful to have you apart of my life - thank you for being so extraordinary and sweet!",
  ];

  List<List<double>> activeLocation = [
    [0.39, 0.48],
    [0.27, 0.35],
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
