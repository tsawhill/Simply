import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  bool setting1 = true;
  bool setting2 = false;
  Color theme = Colors.blue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          Ink(
            color: theme,
            child: ListTile(
              title: Text('Theme color'),
              subtitle: Text('Change theme color of the app'),
              onTap: () {
                colorPick(context);
              },
            )
          ),
          SwitchListTile(
            value: setting1,
            title: Text('Dark mode'),
            onChanged: (newValue) {
              setState(() {
                setting1 = newValue;
              });
            }
          ),
          CheckboxListTile(
              value: setting2,
              title: Text('Test Setting #2'),
              onChanged: (newValue) {
                setState(() {
                  setting2 = newValue;
                });
              }
          )
        ],
      ),
    );
  }

  Color colorPick(BuildContext context){
    Color color = Colors.red;
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: theme,
              onColorChanged: (newColor) => theme = newColor,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ACCEPT'),
              onPressed: () {
                setState((){
                  Navigator.of(context, rootNavigator: true).pop();
                });

              },
            )
          ],
        )
    );
  }
}

