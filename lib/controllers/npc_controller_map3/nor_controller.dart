import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class NorController extends GetxController implements NPCInterface {
  @override
  double get posX => .34 * Get.height;
  @override
  double get posY => .245 * Get.width;
  @override
  String get assetPath => AppAssets.nor;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Nor: ";
  List<String> dialogues = [
    "I just realized its called a waterfall because and it water the fall for its too.",
    "So because then can when water it fall.",
    "Man. I really wish I knew what chair seki is sitting on so i can get the same feeling of touch he has on his pumpkins everyday.",
    "I have to go pick up my girlfriend from kindergarten...",
    "...It's her first day of teaching at school.",
    "Happy Birthday. Thanks for being veryPog. Come play PoE",
  ];

  List<List<double>> activeLocation = [
    [0.30, 0.38],
    [0.20, 0.29],
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
