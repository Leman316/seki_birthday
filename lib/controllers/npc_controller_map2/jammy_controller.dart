import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class JammyController extends GetxController implements NPCInterface {
  @override
  double get posX => .43 * Get.height;
  @override
  double get posY => .275 * Get.width;
  @override
  String get assetPath => AppAssets.jammy;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Jammy: ";
  List<String> dialogues = [
    "K Dramas are my guilty pleasure KEKW.",
    "Brain not working, picking up dog toys and almost threw in the toilet instead of the toy box.",
    "I’ll pay you to not play more Taylor Swift.",
    "flowers are nice but they die, buy a plant instead.",
    "Happy Birthday from your Twitch Mom.",
  ];

  List<List<double>> activeLocation = [
    [0.40, 0.46],
    [0.24, 0.31],
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
