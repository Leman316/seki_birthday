import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '/controllers/character_controller.dart';
import '/utils/helpers.dart';

class PlayerCharacter extends StatelessWidget {
  PlayerCharacter({super.key});
  final CharacterController player = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      dd('${(player.posX.value / Get.height).toStringAsFixed(2)}  ${(player.posY.value / Get.width).toStringAsFixed(2)}');
      return Positioned(
        top: player.posX.value,
        left: player.posY.value,
        child: Image.asset(
          player.currentImage[player.positioning.value] ?? AppAssets.charRight,
          height: AppSizes.newSize(5),
          width: AppSizes.newSize(5),
        ),
      );
    });
  }
}
