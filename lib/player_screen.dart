import 'package:flutter/material.dart';
import 'package:player_advanced/icon_content.dart';
import 'package:player_advanced/input_container.dart';
import 'constants.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool isShuffleSelected = false;
  bool isRepeatSelected = false;

  int selectedVolume = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player App'),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Image.asset('lib/images/player.jpg', width: double.infinity,),
            ),
          ),
          Expanded(
            child: InputContainer(
              color: Color(0xFF515356),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Track Title',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Artist',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFA435F0),
                      overlayColor: Color(0x40A435F0),
                      inactiveTrackColor: Color(0xFF8D8E98),  
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18,),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 34,),                 
                    ),
                    child: Slider(
                      value: selectedVolume.toDouble(),
                      min: 1,
                      max: 100,
                      divisions: 100,
                      onChanged: (double newValue) {
                        setState(() {
                          print(newValue);
                          selectedVolume = newValue.round();
                        });
                      },
                    ),
                  ),
                  Text('Volume: '+selectedVolume.toString()),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: InputContainer(
                      child: IconContent(
                        icon: Icons.shuffle_rounded,
                        labelText: 'SHUFFLE',
                      ),
                      color: isShuffleSelected
                          ? activeCardColor
                          : inActiveCardColor,
                      onPress: () {
                        setState(() {
                          //updateColor(ControlType.repeat);
                          isShuffleSelected = isShuffleSelected ? false : true;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: InputContainer(
                      child: IconContent(
                        icon: Icons.repeat_rounded,
                        labelText: 'REPEAT',
                      ),
                      color: isRepeatSelected
                          ? activeCardColor
                          : inActiveCardColor,
                      onPress: () {
                        setState(() {
                          //updateColor(ControlType.repeat);
                          isRepeatSelected = isRepeatSelected ? false : true;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
