import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:tic_tac_toe/theme/theme_service.dart';


class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
   bool isSwitched = false;
   AudioPlayer audioPlayer=new AudioPlayer();
   Duration duration=new Duration();
   Duration position=new  Duration();
   bool playing =false;
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: NewGradientAppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          gradient: LinearGradient(colors: [Colors.blue, Colors.orange])
          ),
        body:  Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Text("Dark & Light",
                                         style: TextStyle(
                                //  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                   fontFamily: 'Poppins'),
                    ),
                    ThemeSwitcher(
                    builder: (context) {
                      bool isDarkMode =
                          ThemeModelInheritedNotifier.of(context).theme.brightness ==
                              Brightness.light;
                      String themeName = isDarkMode ? 'dark' : 'light';
                      return DayNightSwitcherIcon(
                        isDarkModeEnabled: isDarkMode,
                        onStateChanged: (bool darkMode) async {
                          var service = await ThemeService.instance
                            ..save(darkMode ? 'light' : 'dark');
                          var theme = service.getByName(themeName);
                          ThemeSwitcher.of(context)
                              .changeTheme(theme: theme, isReversed: darkMode);
                        },
                      );
                    },
                    
                  ),
                  ],
                ),


                ////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Text("Sound",
                                         style: TextStyle(
                                //  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                   fontFamily: 'Poppins'),
                    ),
                    
                 Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.orange,
              activeColor: Colors.blue,
            ),
                  ],
                ),
              ],
            ),
          ),
        ),
      
      ),
         );
  }

    



}

