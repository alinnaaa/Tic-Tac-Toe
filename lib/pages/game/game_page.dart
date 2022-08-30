import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tic_tac_toe/constants/ui_constants.dart';
import 'package:tic_tac_toe/controller/game_controller.dart';
import 'package:tic_tac_toe/game_ai/game_util.dart';
import 'package:tic_tac_toe/widgets/circle_widget.dart';
import 'package:tic_tac_toe/widgets/cross_widget.dart';


part 'board_widget.dart';
part 'current_player_widget.dart';
part 'game_action_widget.dart';
part 'game_status_widget.dart';

class GamePageBinding extends Bindings {
  final bool isMultiPlayer;

  GamePageBinding({required this.isMultiPlayer});

  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController(isMultiPlayer));
  }
}

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
   child: Scaffold(
    //  backgroundColor: Colors.white,
      body: Container(
           width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                const Spacer(),
                const GameStatusWidget(),
                const Spacer(flex: 2),
                BoardWidget(size: MediaQuery.of(context).size.width * 0.76),
                const Spacer(),
                const CurrentPlayerWidget(),
                const Spacer(),
                const GameActionWidget(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
     ) );
  }
}
















Future<bool?> showConfirmDialog({
  required BuildContext context,
  String title = "Confirm!",
  required String content,
}) async {
  return showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titleTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text("Ok"),
        ),
      ],
    ),
  );
}