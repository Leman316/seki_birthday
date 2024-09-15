import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class FoxController extends GetxController implements NPCInterface {
  @override
  double get posX => .34 * Get.height;
  @override
  double get posY => .545 * Get.width;
  @override
  String get assetPath => AppAssets.fox;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "FoxSt3v3: ";
  List<String> dialogues = [
    "You're still good at 27 for some years to come. You have to push now Seks.",
    "Literally put you in a cage with a monster and now you gotta step it up.",
    "Bring me to snake eyes and we have a run, Seks.",
    "wtf are you doing, you should be napping.",
    "Seki can't unsee it now, going for the soft spot back there.",
    "Happy Birthday! I'm drinking with you RN, mr. Ro Shadow.",
  ];

  List<List<double>> activeLocation = [
    [0.30, 0.38],
    [0.50, 0.59],
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
