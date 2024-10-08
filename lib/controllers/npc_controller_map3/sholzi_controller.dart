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
    "Oh for fuck's sake! Shut up you gobshite.",
    "50 Quid! 50 Quid! I am a woman of business! What can I say? I'm a good little piggy! oink, oink.",
    "Lichrilly!!! Don't carry anything metal!",
    "God, Gross! That's what feels like when it's night trouble and fellas keep coming onto you. BLEH! Like leeches.",
    "I'm a fucking Twat. I licked a pumpkin for nothing."
  ];

  List<List<double>> activeLocation = [
    [0.68, 0.76],
    [0.08, 0.16],
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
