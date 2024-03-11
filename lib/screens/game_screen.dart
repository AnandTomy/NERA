import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nera2/screens/home_screen.dart';
import 'package:nera2/widgets/coin.dart';
import '../button_controller.dart';
import '../widgets/base.dart';
import '../widgets/inv_button.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({required this.size, super.key});

  final Size size;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  ButtonController buttonController = Get.put(ButtonController());

  late Size size = widget.size;
  late Offset redInitPos;
  late Offset redInitPos1;
  late Offset redInitPos2;
  late Offset blueInitPos;
  late Offset blueInitPos1;
  late Offset blueInitPos2;
  late Offset topLeft;
  late Offset top;
  late Offset topRight;
  late Offset left;
  late Offset center;
  late Offset right;
  late Offset bottomLeft;
  late Offset bottom;
  late Offset bottomRight;
  List<Offset> initOffsets = [];

  @override
  void initState() {
    redInitPos = Offset(size.width / 2 -60-16, size.height / 2 - 200 -32 );
    redInitPos1 = Offset(size.width / 2 -16, size.height / 2 -200-32 );
    redInitPos2 = Offset(size.width / 2 +60-16, size.height / 2  -200-32);

    blueInitPos = Offset(size.width / 2 - 60-16, size.height/2+200);
    blueInitPos1 = Offset(size.width / 2-16, size.height/2+200);
    blueInitPos2 = Offset(size.width / 2 + 60-16, size.height/2+200);

    topLeft = Offset(size.width / 2 - 150 - 16, size.height / 2 - 150 - 16);
    top = Offset(size.width / 2 - 16, size.height / 2 - 150 - 16);
    topRight = Offset(size.width / 2 + 150 - 16, size.height / 2 - 150 - 16);
    left = Offset(size.width / 2 - 150 - 16, size.height / 2 - 16);
    center = Offset(size.width / 2 - 16, size.height / 2 - 16);
    right = Offset(size.width / 2 + 150 - 16, size.height / 2 - 16);
    bottomLeft = Offset(size.width / 2 - 150 - 16, size.height / 2 + 150 - 16);
    bottom = Offset(size.width / 2 - 16, size.height / 2 + 150 - 16);
    bottomRight = Offset(size.width / 2 + 150 - 16, size.height / 2 + 150 - 16);

    initOffsets = [redInitPos, redInitPos1, redInitPos2, blueInitPos, blueInitPos1, blueInitPos2];
    buttonController.selectedOff_1.value = redInitPos;
    buttonController.selectedOff_2.value = redInitPos1;
    buttonController.selectedOff_3.value = redInitPos2;
    buttonController.selectedOff_4.value = blueInitPos;
    buttonController.selectedOff_5.value = blueInitPos1;
    buttonController.selectedOff_6.value = blueInitPos2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   child: Text('reset'),
        //   onPressed: () {
        //     resetGame();
        //   },
        // ),
        backgroundColor: buttonController.isTurn?Color(0xF2EABDBD):Color(0xF2B1CFE7),
        body: Center(
          child:  Stack(
              children: [
                Positioned(
                  bottom: 20,
                    child:SizedBox(
                      width: widget.size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              Get.offAll(HomeScreen());
                            }, icon: Icon(Icons.home_rounded,size: 30,)),
                            IconButton(onPressed: (){
                              resetGame();
                            }, icon: Icon(Icons.restart_alt_rounded,size: 30,))
                          ],
                        ),
                      ),
                    )),
                SafeArea(
                  child: SizedBox(
                    width: widget.size.width,
                    child: Column(

                      children: [
                        Text("SCORE",
                          style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(children: [
                              Text('RED',style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                              Text(buttonController.redScore.toString())
                            ],),
                            Column(children: [
                              Text('BLUE',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                              Text(buttonController.blueScore.toString())
                            ],)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: CustomPaint(
                    size: Size(300, 300), // Size of the square
                    painter: SquarePainter(),
                  ),
                ),
                ...invButtons(),
                Coin(
                    offset: buttonController.selectedOff_1.value,
                    player: false,
                    onTap: () {
                      onButtonTap(1, 'r', buttonController.selectedOff_1.value);
                    }),
                Coin(
                    offset: buttonController.selectedOff_2.value,
                    player: false,
                    onTap: () {
                      onButtonTap(2, 'r', buttonController.selectedOff_2.value);
                    }),
                Coin(
                    offset: buttonController.selectedOff_3.value,
                    player: false,
                    onTap: () {
                      onButtonTap(3, 'r', buttonController.selectedOff_3.value);
                    }),
                Coin(
                    offset: buttonController.selectedOff_4.value,
                    player: true,
                    onTap: () {
                      onButtonTap(4, 'b', buttonController.selectedOff_4.value);
                    }),
                Coin(
                    offset: buttonController.selectedOff_5.value,
                    player: true,
                    onTap: () {
                      onButtonTap(5, 'b', buttonController.selectedOff_5.value);
                    }),
                Coin(
                    offset: buttonController.selectedOff_6.value,
                    player: true,
                    onTap: () {
                      onButtonTap(6, 'b', buttonController.selectedOff_6.value);
                    }),
              ],
            ),

        ),
      ),
    );
  }

  List<Widget> invButtons() {
    return [
      Visibility(
          visible: buttonController.vis1.value,
          child: InvButton(
            () {
              onInvButtonPress(topLeft);
            },
            offset: topLeft,
          )),
      Visibility(
          visible: buttonController.vis2.value,
          child: InvButton(
            () {
              onInvButtonPress(top);
            },
            offset: top,
          )),
      Visibility(
          visible: buttonController.vis3.value,
          child: InvButton(
            () {
              onInvButtonPress(topRight);
            },
            offset: topRight,
          )),
      Visibility(
          visible: buttonController.vis4.value,
          child: InvButton(
            () {
              onInvButtonPress(left);
            },
            offset: left,
          )),
      Visibility(
          visible: buttonController.vis5.value,
          child: InvButton(
            () {
              onInvButtonPress(center);
            },
            offset: center,
          )),
      Visibility(
          visible: buttonController.vis6.value,
          child: InvButton(
            () {
              onInvButtonPress(right);
            },
            offset: right,
          )),
      Visibility(
          visible: buttonController.vis7.value,
          child: InvButton(
            () {
              onInvButtonPress(bottomLeft);
            },
            offset: bottomLeft,
          )),
      Visibility(
          visible: buttonController.vis8.value,
          child: InvButton(
            () {
              onInvButtonPress(bottom);
            },
            offset: bottom,
          )),
      Visibility(
          visible: buttonController.vis9.value,
          child: InvButton(
            () {
              onInvButtonPress(bottomRight);
            },
            offset: bottomRight,
          )),
    ];
  }

  void resetGame() {
    buttonController.clearVis();
    buttonController.reset();
    buttonController.selectedOff_1.value = redInitPos;
    buttonController.selectedOff_2.value = redInitPos1;
    buttonController.selectedOff_3.value = redInitPos2;
    buttonController.selectedOff_4.value = blueInitPos;
    buttonController.selectedOff_5.value = blueInitPos1;
    buttonController.selectedOff_6.value = blueInitPos2;
    initOffsets = [redInitPos, redInitPos1, redInitPos2, blueInitPos, blueInitPos1, blueInitPos2];
  }

  bool isButtonInit(Offset offset) {
    bool boolval = false;
    if (initOffsets.isEmpty) {
      return true;
    }
    boolval = initOffsets.contains(offset);
    initOffsets.remove(offset);
    return boolval;
  }

  String offsetToStr(Offset offset) {
    String off = '';
    if (offset == topLeft) {
      off = 'topLeft';
    } else if (offset == top) {
      off = 'top';
    } else if (offset == topRight) {
      off = 'topRight';
    } else if (offset == left) {
      off = 'left';
    } else if (offset == center) {
      off = 'center';
    } else if (offset == right) {
      off = 'right';
    } else if (offset == bottomLeft) {
      off = 'bottomLeft';
    } else if (offset == bottom) {
      off = 'bottom';
    } else if (offset == bottomRight) {
      off = 'bottomRight';
    }

    return off;
  }

  void onButtonTap(int id, String color, Offset offset) {
    if (id == 1 || id == 2 || id == 3) {
      if (buttonController.isTurn && isButtonInit(offset)) {
        buttonController.id = id;
        buttonController.clearVis();
        buttonController.findGoable(offsetToStr(offset), color);
        buttonController.lastSelectedPos = offsetToStr(offset);
      }
    } else if (id == 4 || id == 5 || id == 6) {
      if (!buttonController.isTurn && isButtonInit(offset)) {
        buttonController.id = id;
        buttonController.clearVis();
        buttonController.findGoable(offsetToStr(offset), color);
        buttonController.lastSelectedPos = offsetToStr(offset);
      }
    }
  }

  void onInvButtonPress(Offset offset) {
    buttonController.clearVis();
    if (buttonController.updateCoin(offset, offsetToStr(offset)) != '') {
      resetGame();
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return Dialog(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Text(buttonController.winner == 'red' ? "RED WINS" : "BLUE WINS"),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               ElevatedButton(
      //                   onPressed: () {
      //                     resetGame();
      //                     Get.back();
      //
      //                   },
      //                   child: Text('Restart')),
      //               ElevatedButton(
      //                   onPressed: () {
      //                     Get.offAll(HomeScreen());
      //                   },
      //                   child: Text('Home'))
      //             ],
      //           )
      //         ],
      //       ),
      //     );
      //   },
      // );
    }
  }
}
