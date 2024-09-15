import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class EllenController extends GetxController implements NPCInterface {
  @override
  double get posX => .65 * Get.height;
  @override
  double get posY => .275 * Get.width;
  @override
  String get assetPath => AppAssets.ngda;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Ellen: ";
  List<String> dialogues = [
    "The louder the screaming, the closer to victory",
    "Idk it's too late my English isnt always englishing ok.",
    "Last night i was looking for ur emotes but was unsubbed. Saddest night of my life.",
    "We hating on pregnant ladies now? what did i miss?",
    "Dude, there's nothing that gets me going like whips.",
    "Wishing you the happiest of birthdays!"
  ];

  List<List<double>> activeLocation = [
    [0.61, 0.69],
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
