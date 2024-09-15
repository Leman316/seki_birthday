import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '/utils/helpers.dart';
import '/views/screens/main_screen.dart';
import '../../consts/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {
          dd(controller.value);
          if (controller.value == 1.0) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              return await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: HexColor("D2A65A"),
                      alignment: Alignment.bottomCenter,
                      content: const Dialog(),
                    );
                  });
            });
          }
        });
      });
    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //   Get.offAll(() => const MainScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.2),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'L O A D I N G',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 300),
                    child: LinearProgressIndicator(
                      value: controller.value,
                      semanticsLabel: 'Linear progress indicator',
                      borderRadius: BorderRadius.circular(12),
                      backgroundColor: HexColor("D2A65A"),
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dialog extends StatelessWidget {
  const Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("D2A65A"),
      height: AppSizes.newSize(6),
      width: AppSizes.newSize(14),
      child: Center(
        child: InkWell(
          onTap: () {
            Get.offAll(() => const MainScreen());
          },
          child: Container(
            width: Get.width * .2,
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: HexColor("E0D6EA"),
              border: Border.all(color: HexColor("D2A65A"), width: 4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "Confirm to Start",
                style: TextStyle(
                  height: 1,
                  fontSize: AppSizes.size15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
