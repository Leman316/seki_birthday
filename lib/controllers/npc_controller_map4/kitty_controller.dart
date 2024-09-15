import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../models/npc_interface.dart';
import '../character_controller.dart';

class KittyController extends GetxController implements NPCInterface {
  @override
  double get posX => .30 * Get.height;
  @override
  double get posY => .205 * Get.width;
  @override
  String get assetPath => AppAssets.kitty;

  RxInt currentDialoguePosition = 0.obs;
  String characterName = "Kitty: ";
  List<String> dialogues = [
    "I'm trying to sneak around, but the clap of my dummy thicc cheeks keeps alerting the guards",
    "I'm gettin out my 12 gauge for that little varmint. We're eatin good for supper tonight",
    "Me scrolling twitter listening to seki lecture me about how brainrotted I am. Skibidi man bussin frfr",
    "I like pickle on my borgar BUSSIN. That's a big cock YesYes.",
    "That's how you know you've stepped into KKona territory is when they start callin dinner supper and there's a church on every block.",
    "is this game better than a cold glass of water on a hot summer day? is this game better than peeling off the plastic on a new electronic device?",
    "Happy Birthday. Glad you're having fun playing all these new games and hanging around with all of us goofballs in chat",
  ];

  List<List<double>> activeLocation = [
    [0.26, 0.34],
    [0.16, 0.25],
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
