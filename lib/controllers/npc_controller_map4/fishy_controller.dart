import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class FishyController extends GetxController implements NPCInterface {
  @override
  double get posX => .62 * Get.height;
  @override
  double get posY => .31 * Get.width;
  @override
  String get assetPath => AppAssets.fishy;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Fishy: ";
  List<String> dialogues = [
    "So...does sekiro use the tanto to shave his stubble to make spirit emblems Aware",
    "'You're a furry' is what she said",
    "Bruh, why am i now PM'ed by an 'Alice' on discord...I blame your server",
    "You check her myanimelist and its all BL monkaS",
    "Happy bday to the most committed and unyielding speed and challenge runner I've ever seen",
  ];

  List<List<double>> activeLocation = [
    [0.58, 0.66],
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
