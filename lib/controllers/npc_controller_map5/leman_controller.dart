import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class LemanController extends GetxController implements NPCInterface {
  @override
  double get posX => .34 * Get.height;
  @override
  double get posY => .685 * Get.width;
  @override
  String get assetPath => AppAssets.leman;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Leman: ";
  List<String> dialogues = [
    "Imagine finding and writing dialogues for everyone. who has time for that? Any helpers?",
    "Late 20's, heh, passed the prime already.",
    "My Game Making Career starts and ends here... PepeLaugh",
    "Gotta pay 9.99 to unlock the combat DLC. YEP",
    "Is this the year Seki finally plays Persona? Shirley",
    "Chat, message me for free early copy of Silksong. Clueless",
    "Me when I have to code -> LemanScripting. Me when I have to write a birthday message -> HardStuck"
  ];

  List<List<double>> activeLocation = [
    [0.30, 0.38],
    [0.64, 0.73],
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
