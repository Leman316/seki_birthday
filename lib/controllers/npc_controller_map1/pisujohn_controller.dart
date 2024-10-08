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
    "Any waifus in chat?",
    "Imagine having an ex to cheat on.",
    "Your multiple times waifu and husbando.",
    "Well, I redeemed a Highlight My Message once. Hoarding for the song now PogTasty.",
    "生日快樂! Happy birthday! Hope you have a nice day.",
  ];

  List<List<double>> activeLocation = [
    [0.23, 0.29],
    [0.57, 0.64],
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
