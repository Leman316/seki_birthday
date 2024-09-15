import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../consts/consts.dart';
import '../../utils/credit_dialog.dart';
import 'game_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.banner,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.background,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.off(() => const GameScreen(), preventDuplicates: false);
                },
                child: Container(
                  width: Get.width * .2,
                  height: AppSizes.newSize(5),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: HexColor("E0D6EA"),
                    border: Border.all(color: HexColor("D2A65A"), width: 4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        width: AppSizes.newSize(4),
                        height: AppSizes.newSize(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: HexColor("D2A65A"),
                        ),
                      ),
                      Text(
                        "START",
                        style: TextStyle(
                          fontSize: AppSizes.size15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: HexColor("D2A65A"),
                          alignment: Alignment.bottomCenter,
                          contentPadding: const EdgeInsets.all(2),
                          content: const CreditDialog(),
                        );
                      });
                },
                child: Container(
                  width: Get.width * .2,
                  height: AppSizes.newSize(5),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: HexColor("E0D6EA"),
                    border: Border.all(color: HexColor("D2A65A"), width: 4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        width: AppSizes.newSize(4),
                        height: AppSizes.newSize(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: HexColor("D2A65A"),
                        ),
                      ),
                      Text(
                        "CREDITS",
                        style: TextStyle(
                          fontSize: AppSizes.size15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
