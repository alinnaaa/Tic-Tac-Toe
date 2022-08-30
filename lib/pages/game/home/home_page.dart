import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/pages/game/home/setting.dart';
import 'package:tic_tac_toe/pages/game/game_page.dart';
import 'package:tic_tac_toe/widgets/logo.dart';
part 'game_title_widget.dart';
part 'game_mode_selection_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // lam box decoration a rang ayay ba scafold aka
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          //  stops: [0.1, 0.65],
          colors: [
            Colors.blue,
            Colors.orange,
          ],
        ),
      ),
      //////////////////////////////////////////////////////////////////
      child: Column(
        children: [
          Flexible(
              flex: 1,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Tic Tac Toe",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 65,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'DancingScript'),
                    ),
                    /////////////////////////////////////////////////////////////////
                    Logo(),

                    // danany logo
                    SizedBox(height: 100),
////////////////////////////////////////////////////////////////////////////////////
                    ///button 1
                    GestureDetector(
                      onTap: () {
         Get.to(() => const GamePage(),
                binding: GamePageBinding(isMultiPlayer: false));
                      }, // la regay amawa containner akaman krd ba on tap
                      child: Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: [
                            BoxShadow(color: Colors.white),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "single player".toUpperCase(),
                            style: TextStyle(
                                color: Colors.black.withOpacity(.8),
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                                ),
                          ),
                        ),
                      ),
                    ),
                    //////////////// //////////////////
                    SizedBox(height: 30),

                    /// ////////////////////////////////button 2
                    GestureDetector(
                      onTap: () {
            Get.to(() => const GamePage(),
                binding: GamePageBinding(isMultiPlayer: true));
                      }, //
                      child: Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: [
                            BoxShadow(color: Colors.white),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "with a friend".toUpperCase(),
                            style: TextStyle(
                                color: Colors.black.withOpacity(.8),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
////////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: 80),
                    IconButton(
                      iconSize: 50.0,
                      color: Colors.white,
                      icon: new Icon(Icons.settings),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SettingsPage(),
                          ),
                        );
                      },
                    )
                  ]))
        ],
      ),
    ));
  }
}