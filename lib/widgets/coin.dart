import 'package:flutter/material.dart';

class Coin extends StatelessWidget {
  const Coin({super.key, required this.offset, required this.player, required this.onTap});
  final Offset offset;
  final bool player;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      top: offset.dy,
      left: offset.dx,
      child: GestureDetector(
        onTap: onTap,
        child: Container(

          width: 32, // Adjust size as needed
          height: 32, // Adjust size as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: player ? Color(0xFF0E3F7A) : Color(0xFFB61515),
          ),
        )
        // CircleAvatar(
        //
        //   radius: 16,
        //   backgroundColor: player ? Color(0xFF0E3F7A) : Color(0xFFB61515),
        // ),
      ),
    );
  }
}