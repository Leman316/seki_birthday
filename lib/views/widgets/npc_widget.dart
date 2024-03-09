import 'package:flutter/material.dart';

import '../../consts/consts.dart';
import '/models/npc_interface.dart';

class NPCWidget extends StatefulWidget {
  const NPCWidget({super.key, required this.controller, this.size = 5.0});
  final NPCInterface controller;
  final double size;
  @override
  State<NPCWidget> createState() => _NPCWidgetState();
}

class _NPCWidgetState extends State<NPCWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.controller.posX,
      left: widget.controller.posY,
      child: Image.asset(
        widget.controller.assetPath,
        height: AppSizes.newSize(widget.size),
        width: AppSizes.newSize(widget.size),
      ),
    );
  }
}
