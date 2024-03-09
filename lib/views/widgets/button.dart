import 'dart:async';

import 'package:flutter/material.dart';

import '../../consts/consts.dart';

class TapButton extends StatefulWidget {
  const TapButton(this.text, {this.function, super.key});
  final String text;
  final VoidCallback? function;

  @override
  State<TapButton> createState() => _TapButtonState();
}

class _TapButtonState extends State<TapButton> {
  Timer? _timer;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      onTapDown: (TapDownDetails details) {
        // This function will be called when the user taps down on the button
        _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
          widget.function!();
        });
      },
      onTapUp: (TapUpDetails details) {
        _timer?.cancel();
      },
      child: Container(
        width: AppSizes.newSize(6),
        height: AppSizes.newSize(6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.6),
          border: Border.all(width: 2, color: Colors.white.withOpacity(.3)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: AppSizes.size13,
            ),
          ),
        ),
      ),
    );
  }
}
