import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonController extends GetxController {

  Rx<int> _redScore = 0.obs;


  int get redScore => _redScore.value;

  set redScore(int value) {
    _redScore.value = value;
  }
  Rx<int> _blueScore = 0.obs;

  int get blueScore => _blueScore.value;

  set blueScore(int value) {
    _blueScore.value = value;

  }



  Rx<bool> vis1 = false.obs;
  Rx<bool> vis2 = false.obs;
  Rx<bool> vis3 = false.obs;
  Rx<bool> vis4 = false.obs;
  Rx<bool> vis5 = false.obs;
  Rx<bool> vis6 = false.obs;
  Rx<bool> vis7 = false.obs;
  Rx<bool> vis8 = false.obs;
  Rx<bool> vis9 = false.obs;

  List<Offset> initOffsets = [];

  void clearVis() {
    vis1.value = false;
    vis2.value = false;
    vis3.value = false;
    vis4.value = false;
    vis6.value = false;
    vis7.value = false;
    vis8.value = false;
    vis9.value = false;
    vis5.value = false;
  }

  List<List<String>> positions = [
    ['z', 'z', 'z'],
    ['z', 'z', 'z'],
    ['z', 'z', 'z']
  ];

  // bool isButtonSelected = false;
  String lastSelectedPos = '';
  // set setButtonSelected(bool) {
  //   isButtonSelected = bool;
  //   print('iin setter $bool snd $isButtonSelected');
  // }

  String winner = '';
  Rx<bool> _isTurn = false.obs;

  bool get isTurn => _isTurn.value;

  set isTurn(bool value) {
    _isTurn.value = value;
  }
  int id = 0;
  Offset selectedButtonOffset = Offset(0, 0);

  Rx<Offset> selectedOff_1 = Offset(0, 0).obs;
  Rx<Offset> selectedOff_2 = Offset(0, 0).obs;
  Rx<Offset> selectedOff_3 = Offset(0, 0).obs;
  Rx<Offset> selectedOff_4 = Offset(0, 0).obs;
  Rx<Offset> selectedOff_5 = Offset(0, 0).obs;
  Rx<Offset> selectedOff_6 = Offset(0, 0).obs;

  void reset() {
    positions = [
      ['z', 'z', 'z'],
      ['z', 'z', 'z'],
      ['z', 'z', 'z']
    ];
    winner = '';
  }



  void findGoable(String offset, String pos) {
    if (offset == 'topLeft') {
      vis2.value = true;
      vis4.value = true;
      vis5.value = true;
    } else if (offset == 'top') {
      vis1.value = true;
      vis3.value = true;
      vis5.value = true;
    } else if (offset == 'topRight') {
      vis2.value = true;
      vis6.value = true;
      vis5.value = true;
    } else if (offset == 'left') {
      vis1.value = true;
      vis5.value = true;
      vis7.value = true;
    } else if (offset == 'center') {
      vis1.value = true;
      vis2.value = true;
      vis3.value = true;
      vis4.value = true;
      vis6.value = true;
      vis7.value = true;
      vis8.value = true;
      vis9.value = true;
    } else if (offset == 'right') {
      vis3.value = true;
      vis9.value = true;
      vis5.value = true;
    } else if (offset == 'bottomLeft') {
      vis4.value = true;
      vis5.value = true;
      vis8.value = true;
    } else if (offset == 'bottom') {
      vis7.value = true;
      vis9.value = true;
      vis5.value = true;
    } else if (offset == 'bottomRight') {
      vis5.value = true;
      vis8.value = true;
      vis6.value = true;
    } else {
      vis1.value = true;
      vis2.value = true;
      vis3.value = true;
      vis4.value = true;
      vis5.value = true;
      vis6.value = true;
      vis7.value = true;
      vis8.value = true;
      vis9.value = true;
    }
  }

  void checkInLine() {
    print('chek in linr');
    for (int i = 0; i < positions.length; i++) {
      print(positions[i][0] + " " + positions[i][1] + " " + positions[i][2]);
    }
    print('');
    String ans = '';
    String ansCros = '';

    for (int i = 0; i < positions.length; i++) {
      if (positions[i][0] == 'r' && positions[i][1] == 'r' && positions[i][2] == 'r') {
        winner = 'red';
      }
      if (positions[i][0] == 'b' && positions[i][1] == 'b' && positions[i][2] == 'b') {
        winner = 'blue';
      }
      if (positions[0][i] == 'r' && positions[1][i] == 'r' && positions[2][i] == 'r') {
        winner = 'red';
      }
      if (positions[0][i] == 'b' && positions[1][i] == 'b' && positions[2][i] == 'b') {
        winner = 'blue';
      }
      ans += positions[i][i];
    }
    for (int i = 0; i < positions.length; i++) {
      ansCros += positions[i][positions.length - 1 - i];
    }
    if (ans == 'rrr' || ansCros == 'rrr') {
      winner = 'red';
    }
    if (ans == 'bbb' || ansCros == 'bbb') {
      winner = 'blue';
    }
    if (winner == 'red') {
      redScore++;
      Get.snackbar('Red Wins', 'message',snackPosition: SnackPosition.BOTTOM);
    } else if (winner == 'blue') {
      blueScore++;
      Get.snackbar('blue Wins', 'message',snackPosition: SnackPosition.BOTTOM);
    }
  }

  void changeTurn() {
    isTurn = !isTurn;
  }

  void setPos(String pos, String col) {
    if (pos == 'topLeft') {
      positions[0][0] = col;
    } else if (pos == 'top') {
      positions[0][1] = col;
    } else if (pos == 'topRight') {
      positions[0][2] = col;
    } else if (pos == 'left') {
      positions[1][0] = col;
    } else if (pos == 'center') {
      positions[1][1] = col;
    } else if (pos == 'right') {
      positions[1][2] = col;
    } else if (pos == 'bottomLeft') {
      positions[2][0] = col;
    } else if (pos == 'bottom') {
      positions[2][1] = col;
    } else if (pos == 'bottomRight') {
      positions[2][2] = col;
    }
  }

  String updateCoin(Offset offset, String pos) {
    setPos(lastSelectedPos, 'z');

    switch (id) {
      case 1:
        selectedOff_1.value = offset;
        setPos(pos, 'r');

        break;
      case 2:
        selectedOff_2.value = offset;
        setPos(pos, 'r');
        break;
      case 3:
        selectedOff_3.value = offset;
        setPos(pos, 'r');
        break;
      case 4:
        selectedOff_4.value = offset;
        setPos(pos, 'b');
        break;
      case 5:
        selectedOff_5.value = offset;
        setPos(pos, 'b');

        break;
      case 6:
        selectedOff_6.value = offset;
        setPos(pos, 'b');
    }
    checkInLine();
    return winner;
  }
}