import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../character_controller.dart';
import '../../models/npc_interface.dart';

class CharityController extends GetxController implements NPCInterface {
  @override
  double get posX => .67 * Get.height;
  @override
  double get posY => .555 * Get.width;
  @override
  String get assetPath => AppAssets.charity;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "HighCharity: ";
  List<String> dialogues = [
    "I dreamt recently that you started doing coke seki. And I had a massive argument with you over it because you went skinny and strange looking.",
    "Hey kiddo, wanna become a furry like me?. It's great, trust me .",
    "Getting swole, smashed an ex, my high school teacher.",
    "Get your Master Chief cosplay out, you cunt.",
    "Sekis had 3 guys in one go. Slapping it on his face whilst he's knelt down. Gayge.",
    "Happy Birthday from this freeloader.",
  ];

  List<List<double>> activeLocation = [
    [0.64, 0.70],
    [0.52, 0.59],
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
