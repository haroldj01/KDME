import 'package:flutter/material.dart';
import 'package:kdmadeeasy/enums/settings.dart';
import 'package:kdmadeeasy/notifiers/settings_notifier.dart';
import 'package:kdmadeeasy/utils/methods.dart';
import 'package:provider/provider.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({required this.displayOption,
    super.key,
  });

  final Settings displayOption;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder: (_, notifier, __) =>
          Column(
            children: [
              SwitchListTile(
                  title: Text(displayOption.toText()),
                  value: notifier.displayOptions.entries.firstWhere((element) => element.key
                      == displayOption).value,
                  onChanged: (value){
                    notifier.updateDisplayOptions(displayOption: displayOption, isToggled: value);
                  }),
              Divider(height: 1, thickness: 1,)
            ],
          ),
    );
  }
}