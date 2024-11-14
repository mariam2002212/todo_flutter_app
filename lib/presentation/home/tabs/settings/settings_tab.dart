import 'package:flutter/material.dart';
import 'package:todo/core/utils/colors_manager.dart';
import 'package:todo/core/utils/text_styles.dart';

typedef OnChanged = void Function(String?);

class SettingsTab extends StatefulWidget {
  final Function(ThemeMode) switchTheme;

  SettingsTab({super.key, required this.switchTheme});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedTheme = 'Light';
  String selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Theme',
            style: LightTxtStyles.settingsTabLabel,
          ),
          SizedBox(height: 4),
          buildSettingsTabComponent(
            'Light',
            'Dark',
            selectedTheme,
                (newTheme) {
              print('Selected theme in sett: $newTheme');
              setState(() {
                selectedTheme = newTheme ?? selectedTheme;
              });

              if (newTheme == 'Light') {
                widget.switchTheme(ThemeMode.light);
              } else {
                widget.switchTheme(ThemeMode.dark);
              }
            },
          ),
          SizedBox(height: 12),
          Text(
            'Language',
            style: LightTxtStyles.settingsTabLabel,
          ),
          SizedBox(height: 4),
          buildSettingsTabComponent(
            'English',
            'Arabic',
            selectedLang,
                (newLang) {
              setState(() {
                selectedLang = newLang ?? selectedLang;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildSettingsTabComponent(
      String item1, String item2, String textView, OnChanged onChanged) {
    return Container(
      height: 48,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border.all(width: 1, color: ColorsManager.blue),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textView, style: LightTxtStyles.selectedItemLabel),
          DropdownButton<String>(
            underline: SizedBox(),
            borderRadius: BorderRadius.circular(12),
            items: <String>[item1, item2].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
