import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/character_controller.dart';

import '../../consts/consts.dart';
import 'custom_typewriter.dart';

class SpeechBubble extends StatefulWidget {
  const SpeechBubble({super.key});

  @override
  State<SpeechBubble> createState() => _SpeechBubbleState();
}

class _SpeechBubbleState extends State<SpeechBubble> {
  CharacterController player = Get.find();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: AppSizes.newSize(15), vertical: 30),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.9),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          width: Get.width * .65,
          child: AnimatedTextKit(
            animatedTexts: [
              CustomTypewriterAnimatedText(
                player.dialogueText.value,
                textStyle: TextStyle(
                  fontSize: AppSizes.size13,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 50),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 50),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          )
          //  Text(player.dialogueText.value),
          ),
    );
  }
}
