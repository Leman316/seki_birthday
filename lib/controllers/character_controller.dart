import 'package:get/get.dart';
import 'package:seki_birthday/utils/helpers.dart';

import '/controllers/map_controller.dart';
import '../consts/consts.dart';
import 'npc_controllers.dart';

class CharacterController extends GetxController {
  RxDouble posX = (Get.height * .8).obs;
  RxDouble posY = (Get.width * .2).obs;
  RxInt positioning = 1.obs;
  int speed = 7;
  MapController mapController = Get.find();
  RxBool stuck = false.obs;
  RxBool showDialogue = false.obs;
  RxString dialogueText = ''.obs;
  RxBool started = false.obs;

  Map<int, String> currentImage = {
    1: AppAssets.charUp,
    2: AppAssets.charDown,
    3: AppAssets.charLeft,
    4: AppAssets.charRight,
  };

  NatController jerzy = Get.put(NatController());
  CharityController charity = Get.put(CharityController());
  PisuJohnController john = Get.put(PisuJohnController());

  JammyController jammy = Get.put(JammyController());
  PasswordzController passwordz = Get.put(PasswordzController());
  EllenController ngda = Get.put(EllenController());

  TopsuController topsu = Get.put(TopsuController());
  SholziController sholzi = Get.put(SholziController());
  NorController nor = Get.put(NorController());

  KittyController kitty = Get.put(KittyController());
  FishyController fishy = Get.put(FishyController());
  FoxController fox = Get.put(FoxController());

  LemanController leman = Get.put(LemanController());
  PayController pay = Get.put(PayController());

  void move(Direction direction) {
    speed = 7;
    if (started.value) return;

    writeStorage("map", mapController.currentMap.value);

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
      List<bool> isOverlap = overlapCheck(mapController.map3NoGoZones, xPosition, yPosition);

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
              mapController.currentMap.value = 5;

              posX.value = posX.value - Get.height * .05;
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
    } else if (mapController.currentMap.value == 5) {
      List<bool> isOverlap = overlapCheck(mapController.map5NoGoZones, xPosition, yPosition);
      stuckCheck(direction);
      if (!isOverlap.any((element) => element == true)) {
        switch (direction) {
          case Direction.up:
            if (posX.value >= Get.height * .05 && posY.value >= Get.width * .1) posX.value -= speed;
            positioning.value = 1;
            break;
          case Direction.down:
            if (posX.value <= Get.height * .60 && posY.value >= Get.width * .1) posX.value += speed;
            positioning.value = 2;
            break;
          case Direction.left:
            if (posY.value >= Get.width * .1 || Get.height * .32 <= posX.value && posX.value <= Get.height * .48) {
              posY.value -= speed;
              if (posY.value <= Get.width * .02) {
                mapController.currentMap.value = 4;
                posX.value = (Get.height) * .46;
                posY.value = (Get.width * .69);
              }
            }

            positioning.value = 3;
            break;
          case Direction.right:
            if (posY.value >= Get.width * .7) {
              //   mapController.currentMap.value = 5;
              //    posY.value = Get.width * .03;
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
    for (List<List<double>> item in mapnoGoZones) {
      isOverlap[mapnoGoZones.indexOf(item)] = (xPosition > item.first.first && xPosition <= item.first.last) &&
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
    speed = 0;

    setup();
    positioning.value = 4;
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
        jammy.showDialogue(xPosition, yPosition);
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
        fishy.showDialogue(xPosition, yPosition);
        fox.showDialogue(xPosition, yPosition);
      }
      if (mapController.currentMap.value == 5) {
        leman.showDialogue(xPosition, yPosition);
        pay.showDialogue(xPosition, yPosition);
      }
    }
  }

  double calculatePosition(double value, double dimension) {
    return double.parse((value / dimension).toStringAsFixed(2));
  }

  setup() {
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
    } else if (mapController.currentMap.value == 5) {
      posX.value = (Get.height * .44);
      posY.value = (Get.width * .03);
    }
  }

  @override
  void onInit() {
    super.onInit();
    setup();
  }
}

enum Direction { up, down, left, right }
