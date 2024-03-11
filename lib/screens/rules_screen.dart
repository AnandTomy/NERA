import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var col = const Color.fromARGB(255, 59, 59, 61);
    return Scaffold(
      backgroundColor: Color.fromARGB(242, 234, 189, 189),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'RULES',
                style: GoogleFonts.exo2(
                  color:  col,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Turn-based Movement: Players take turns moving one of their pieces to an adjacent empty position on the grid.',
              style: GoogleFonts.exo2(
                color: col,
                fontWeight: FontWeight.bold
              ),
            ),SizedBox(height: 20),
            Text(
              '2. Initial Placement: At the beginning of the game, each player has three pieces of their color placed on the board.',
              style: GoogleFonts.exo2(
                color: col,fontWeight: FontWeight.bold
              ),),SizedBox(height: 20),
            Text(
              '3. Adjacent Movement: A player can only move their piece to an adjacent empty position on the grid (horizontally, vertically, or diagonally).',
              style: GoogleFonts.exo2(
                color: col,fontWeight: FontWeight.bold
              ),),SizedBox(height: 20),
            Text(
              '4. Win Condition: The game ends when one player successfully forms a line of three pieces of their color either horizontally, vertically, or diagonally. The player who achieves this wins the game.',
              style: GoogleFonts.exo2(
                color: col,fontWeight: FontWeight.bold
              ),),
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
