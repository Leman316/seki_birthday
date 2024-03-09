import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/npc_controllers.dart';
import '/consts/consts.dart';
import '/controllers/character_controller.dart';
import '/controllers/map_controller.dart';
import '/views/widgets/button.dart';
import '/views/widgets/character.dart';
import '/views/widgets/npc_widget.dart';
import '/views/widgets/speech_bubble.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    this.page = 0,
  });
  final int page;

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  //AuthController authController = Get.find();
  CharacterController player = Get.put(CharacterController());
  MapController mapController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Obx(
            () => Container(
              width: kIsWeb ? 1200 : Get.width * .9,
              height: Get.height,
              margin: EdgeInsets.only(left: Get.width * .15, right: Get.width * .1),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    mapController.showMap[mapController.currentMap.value] ?? AppAssets.map1,
                  ),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                ),
              ),
              child: Stack(
                children: [
                  if (mapController.currentMap.value == 1) ...[
                    NPCWidget(controller: JerzyController()),
                    NPCWidget(controller: CharityController()),
                    NPCWidget(controller: PisuJohnController()),
                  ],
                  if (mapController.currentMap.value == 2) ...[
                    NPCWidget(controller: EllenController()),
                    NPCWidget(controller: NGController()),
                    NPCWidget(controller: PasswordzController()),
                  ],
                  if (mapController.currentMap.value == 3) ...[
                    NPCWidget(controller: NorController()),
                    NPCWidget(controller: SholziController()),
                    NPCWidget(controller: TopsuController()),
                  ],
                  if (mapController.currentMap.value == 4) ...[
                    NPCWidget(controller: KittyController()),
                  ],
                  PlayerCharacter(),
                  if (player.showDialogue.value) const SpeechBubble(),
                ],
              ),
            ),
          ),
          Positioned(
            left: AppSizes.newSize(5.5),
            bottom: AppSizes.newSize(10),
            child: Row(
              children: [
                TapButton(
                  'W',
                  function: () => player.move(Direction.up),
                )
              ],
            ),
          ),
          Positioned(
            left: AppSizes.newSize(0),
            bottom: AppSizes.newSize(4),
            child: Row(
              children: [
                TapButton(
                  'A',
                  function: () => player.move(Direction.left),
                ),
                TapButton(
                  'S',
                  function: () => player.move(Direction.down),
                ),
                TapButton(
                  'D',
                  function: () => player.move(Direction.right),
                )
              ],
            ),
          ),
          Positioned(
            right: AppSizes.newSize(3),
            top: AppSizes.newSize(12),
            child: Row(
              children: [
                TapButton(
                  'R',
                  function: () {
                    player.reset();
                  },
                )
              ],
            ),
          ),
          Positioned(
            right: AppSizes.newSize(3),
            bottom: AppSizes.newSize(12),
            child: Row(
              children: [
                TapButton(
                  'X',
                  function: () => player.interact(),
                )
              ],
            ),
          ),
          Positioned(
            right: AppSizes.newSize(3),
            bottom: AppSizes.newSize(5.5),
            child: Row(
              children: [
                TapButton(
                  'Y',
                  function: () => player.showDialogue.value = false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
