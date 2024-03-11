

import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rules:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Turn-based Movement: Players take turns moving one of their pieces to an adjacent empty position on the grid.',
            ),
            Text(
              '2. Initial Placement: At the beginning of the game, each player has three pieces of their color placed on the board.',
            ),
            Text(
              '3. Adjacent Movement: A player can only move their piece to an adjacent empty position on the grid (horizontally, vertically, or diagonally).',
            ),
            Text(
              '4. Win Condition: The game ends when one player successfully forms a line of three pieces of their color either horizontally, vertically, or diagonally. The player who achieves this wins the game.',
            ),
            SizedBox(height: 20),
            Text(
              'Enjoy playing!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}