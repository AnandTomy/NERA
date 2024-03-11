import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../button_controller.dart';

class InvButton extends StatelessWidget {
  const InvButton(this.onTap, {super.key, required this.offset});

  final VoidCallback onTap;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    ButtonController myController = Get.find<ButtonController>();
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: GestureDetector(
        onTap: () {
          myController.changeTurn();
          onTap();
        },
        child:Container(
          width: 32, // Adjust size as needed
          height: 32, // Adjust size as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0x7BFFDC00),
          ),
        )
        // CircleAvatar(radius: 16, backgroundColor: Color(0x7BFFDC00)),
      ),
    );
  }
}