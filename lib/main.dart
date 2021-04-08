import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ColorPicker(),
    );
  }
}

class ColorPicker extends StatefulWidget {
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  //Separate variables for red, green, blue to keep track of the corresponding slider value
  //Initially all the values set to 255 (max value)
  double _currentRedSliderValue = 255;
  double _currentGreenSliderValue = 255;
  double _currentBlueSliderValue = 255;

  //Function to convert RGB value to corresponding Hex Code value
  String hexOfRGBA(int r, int g, int b, {double opacity = 1}) {
    opacity = (opacity < 0) ? -opacity : opacity;
    opacity = (opacity > 1) ? 255 : opacity * 255;
    int a = opacity.toInt();
    return ('0x${a.toRadixString(16)}${r.toRadixString(16)}${g.toRadixString(16)}${b.toRadixString(16)}');
  }

  //Function to display values of RGB a text on screen
  Widget textDisplay(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
      ),
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(
            _currentRedSliderValue.round(),
            _currentGreenSliderValue.round(),
            _currentBlueSliderValue.round(),
            1.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'RGB Values',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            textDisplay(
                              'R: ' + _currentRedSliderValue.round().toString(),
                            ),
                            textDisplay(
                              'G: ' + _currentGreenSliderValue.round().toString(),
                            ),
                            textDisplay(
                              'B: ' + _currentBlueSliderValue.round().toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'HEX Code',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          hexOfRGBA(
                            _currentRedSliderValue.round(),
                            _currentGreenSliderValue.round(),
                            _currentBlueSliderValue.round(),
                          ).toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Slider(
                  value: _currentRedSliderValue,
                  min: 0,
                  max: 255,
                  // divisions: 5,
                  // label: _currentRedSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentRedSliderValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                Slider(
                  value: _currentGreenSliderValue,
                  min: 0,
                  max: 255,
                  // divisions: 5,
                  // label: _currentGreenSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentGreenSliderValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                Slider(
                  value: _currentBlueSliderValue,
                  min: 0,
                  max: 255,
                  //divisions: 5,
                  //label: _currentBlueSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentBlueSliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
