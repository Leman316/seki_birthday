import 'package:get/get.dart';

import '../consts/consts.dart';
import '/controllers/map_controller.dart';
import 'npc_controllers.dart';

class CharacterController extends GetxController {
  RxDouble posX = (Get.height * .8).obs;
  RxDouble posY = (Get.width * .2).obs;
  RxInt positioning = 4.obs;
  int speed = 7;
  MapController mapController = Get.find();
  RxBool stuck = false.obs;
  RxBool showDialogue = false.obs;
  RxString dialogueText = ''.obs;

  Map<int, String> currentImage = {
    1: AppAssets.charUp,
    2: AppAssets.charDown,
    3: AppAssets.charLeft,
    4: AppAssets.charRight,
  };

  JerzyController jerzy = Get.put(JerzyController());
  CharityController charity = Get.put(CharityController());
  PisuJohnController john = Get.put(PisuJohnController());
  EllenController ellen = Get.put(EllenController());
  PasswordzController passwordz = Get.put(PasswordzController());
  NGController ngda = Get.put(NGController());
  TopsuController topsu = Get.put(TopsuController());
  SholziController sholzi = Get.put(SholziController());
  NorController nor = Get.put(NorController());
  KittyController kitty = Get.put(KittyController());

  void move(Direction direction) {
    double xPosition = calculatePosition(posX.value, Get.height);
    double yPosition = calculatePosition(posY.value, Get.width);
    showDialogue.value = false;
    if (mapController.currentMap.value == 1) {
      List<bool> isOverlap = overlapCheck(mapController.map1NoGoZones, xPosition, yPosition);
      stuckCheck(direction);

      if (!isOverlap.any((element) => element == true)) {
        switch (direction) {
          case Direction.up:
            if (posX.value >= Get.height * .1) posX.value -= speed;
            positioning.value = 1;
            break;
          case Direction.down:
            if (posX.value <= Get.height * .8) posX.value += speed;
            positioning.value = 2;
            break;
          case Direction.left:
            if (posY.value >= Get.width * .07) posY.value -= speed;
            positioning.value = 3;
            break;
          case Direction.right:
            if (posY.value <= Get.width * .67) posY.value += speed;

            if (posY.value >= Get.width * .67 && (posX.value >= Get.height * .23 && posX.value <= Get.height * .32)) {
              posY.value += speed;
            }

            if (posY.value >= Get.width * .7 && (posX.value >= Get.height * .23 && posX.value <= Get.height * .32)) {
              mapController.currentMap.value = 2;
              posX.value = (Get.height * .2);
              posY.value = (Get.width * .04);
            }
            positioning.value = 4;
            break;
        }
      }
    } else if (mapController.currentMap.value == 2) {
      List<bool> isOverlap = overlapCheck(mapController.map2NoGoZones, xPosition, yPosition);
      stuckCheck(direction);

      if (!isOverlap.any((element) => element == true)) {
        switch (direction) {
          case Direction.up:
            if (posX.value >= Get.height * .1) posX.value -= speed;
            positioning.value = 1;
            break;
          case Direction.down:
            if (posX.value <= Get.height * .8) posX.value += speed;
            positioning.value = 2;
            break;
          case Direction.left:
            if (posY.value >= Get.width * .07) posY.value -= speed;
            if (posY.value <= Get.width * .07 && (posX.value >= Get.height * .1 && posX.value <= Get.height * .33)) {
              posY.value -= speed;
              if (posY.value <= Get.width * .02) {
                mapController.currentMap.value = 1;
                posX.value = (Get.height * .25);
                posY.value = (Get.width * .69);
              }
            }
            positioning.value = 3;
            break;
          case Direction.right:
            if (posY.value >= Get.width * .7) {
              mapController.currentMap.value = 3;
              posY.value = Get.width * .03;
            } else {
              posY.value += speed;
            }
            positioning.value = 4;
            break;
        }
      }
    } else if (mapController.currentMap.value == 3) {
      List<bool> isOverlap = List.generate(mapController.map3NoGoZones.length, (index) => false);
      stuckCheck(direction);

      if (!isOverlap.any((element) => element == true)) {
        switch (direction) {
          case Direction.up:
            if (posX.value >= Get.height * .1) posX.value -= speed;
            positioning.value = 1;
            break;
          case Direction.down:
            if (posX.value <= Get.height * .8) posX.value += speed;
            positioning.value = 2;
            break;
          case Direction.left:
            if (posY.value >= Get.width * .02) posY.value -= speed;
            if (posY.value <= Get.width * .02) {
              mapController.currentMap.value = 2;
              posY.value = (Get.width * .69);
            }
            positioning.value = 3;
            break;
          case Direction.right:
            if (posY.value >= Get.width * .7) {
              mapController.currentMap.value = 4;
              posY.value = Get.width * .03;
            } else {
              if (posX.value <= Get.height * .37 || posX.value >= Get.height * .57) {
                if (posY.value <= Get.width * .6) {
                  posY.value += speed;
                }
              } else {
                posY.value += speed;
              }
            }
            positioning.value = 4;
            break;
        }
      }
    } else if (mapController.currentMap.value == 4) {
      List<bool> isOverlap = overlapCheck(mapController.map4NoGoZones, xPosition, yPosition);
      stuckCheck(direction);

      if (!isOverlap.any((element) => element == true)) {
        switch (direction) {
          case Direction.up:
            if (posX.value >= Get.height * .26) posX.value -= speed;
            positioning.value = 1;
            break;
          case Direction.down:
            if (posX.value <= Get.height * .67) posX.value += speed;
            positioning.value = 2;
            break;
          case Direction.left:
            if (posY.value >= Get.width * .02) posY.value -= speed;
            if (posY.value <= Get.width * .02) {
              mapController.currentMap.value = 3;
              posX.value = (Get.height) * .46;
              posY.value = (Get.width * .69);
            }
            positioning.value = 3;
            break;
          case Direction.right:
            if (posY.value >= Get.width * .7) {
              mapController.currentMap.value = 4;
              posY.value = Get.width * .03;
            } else {
              if (posX.value <= Get.height * .44 || posX.value >= Get.height * .53) {
                if (posY.value <= Get.width * .67) {
                  posY.value += speed;
                }
              } else {
                posY.value += speed;
              }
            }
            positioning.value = 4;
            break;
        }
      }
    }
  }

  List<bool> overlapCheck(List<List<List<double>>> mapnoGoZones, double xPosition, double yPosition) {
    List<bool> isOverlap = List.generate(mapnoGoZones.length, (index) => false);
    for (var item in mapController.map1NoGoZones) {
      isOverlap[mapController.map1NoGoZones.indexOf(item)] =
          (xPosition > item.first.first && xPosition <= item.first.last) &&
              (yPosition > item.last.first && yPosition <= item.last.last);
    }
    if (isOverlap.any((element) => true)) {
      stuck.value = true;
    }
    return isOverlap;
  }

  stuckCheck(Direction direction) {
    if (stuck.value) {
      if (positioning.value == 1 && direction == Direction.down) {
        posX.value += speed;
      }
      if (positioning.value == 2 && direction == Direction.up) {
        posX.value -= speed;
      }
      if (positioning.value == 3 && direction == Direction.right) {
        posY.value += speed;
      }
      if (positioning.value == 4 && direction == Direction.left) {
        posY.value -= speed;
      }
      stuck.value = false;
    }
  }

  reset() {
    if (mapController.currentMap.value == 1) {
      posX.value = (Get.height * .8);
      posY.value = (Get.width * .2);
    } else if (mapController.currentMap.value == 2) {
      posX.value = (Get.height * .23);
      posY.value = (Get.width * .06);
    } else if (mapController.currentMap.value == 3) {
      posX.value = (Get.height * .46);
      posY.value = (Get.width * .02);
    } else if (mapController.currentMap.value == 4) {
      posX.value = (Get.height * .44);
      posY.value = (Get.width * .03);
    }
  }

  interact() {
    if (!showDialogue.value) {
      double xPosition = calculatePosition(posX.value, Get.height);
      double yPosition = calculatePosition(posY.value, Get.width);
      if (mapController.currentMap.value == 1) {
        jerzy.showDialogue(xPosition, yPosition);
        john.showDialogue(xPosition, yPosition);
        charity.showDialogue(xPosition, yPosition);
      }
      if (mapController.currentMap.value == 2) {
        ellen.showDialogue(xPosition, yPosition);
        ngda.showDialogue(xPosition, yPosition);
        passwordz.showDialogue(xPosition, yPosition);
      }
      if (mapController.currentMap.value == 3) {
        nor.showDialogue(xPosition, yPosition);
        topsu.showDialogue(xPosition, yPosition);
        sholzi.showDialogue(xPosition, yPosition);
      }
      if (mapController.currentMap.value == 4) {
        kitty.showDialogue(xPosition, yPosition);
      }
      if (mapController.currentMap.value == 5) {}
    }
  }

  double calculatePosition(double value, double dimension) {
    return double.parse((value / dimension).toStringAsFixed(2));
  }
}

enum Direction { up, down, left, right }
