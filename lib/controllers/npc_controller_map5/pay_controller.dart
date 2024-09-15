import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class PayController extends GetxController implements NPCInterface {
  @override
  double get posX => .33 * Get.height;
  @override
  double get posY => .38 * Get.width;
  @override
  String get assetPath => AppAssets.pay;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Pay: ";
  List<String> dialogues = [
    "Nice cock. Get that up ya",
    "The old man's still got it. Knowers say I'm actually in my prime.",
    "Right I tell you wot, you fat little Cunt",
    "Yoooo, What's Poppin' Guys. jennni1Hi ",
    "I just realized how fucking much gen Z slang I actually know, and how much I actually use even straight up english stuff while speaking German.",
    "That Sheila is built like a fucking brick shithouse",
    "That Magpoi has got his eye on the postie. Look at him goooo!",
  ];

  List<List<double>> activeLocation = [
    [0.29, 0.37],
    [0.34, 0.42],
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
