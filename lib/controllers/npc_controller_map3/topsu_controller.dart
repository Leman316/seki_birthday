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
    "Wait, this isn't a Forsen stream.",
    "My whole personality is being a forsen viewer.",
    "Making dumb niche jokes that no one except maybe leman will get. Aware",
    "Maybe One day, I'll be able to beat your run. BillyApprove",
    "Yeah its definitely cool to hold WR at least once even if the run wasn't too great",
    "happy birthday! FeelsStrongMan.",
  ];

  List<List<double>> activeLocation = [
    [0.24, 0.32],
    [0.51, 0.59],
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
