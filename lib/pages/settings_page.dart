import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdmadeeasy/components/app/custom_appbar.dart';
import 'package:kdmadeeasy/components/settings/settings_tile.dart';
import 'package:kdmadeeasy/components/settings/switch_button.dart';
import 'package:kdmadeeasy/configs/constants.dart';
import 'package:kdmadeeasy/databases/database_manager.dart';
import 'package:kdmadeeasy/enums/settings.dart';
import 'package:kdmadeeasy/notifiers/settings_notifier.dart';
import 'package:kdmadeeasy/utils/methods.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder: (_, notifier, __) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kAppBarHeight),
            child: CustomAppBar()),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: kYellow, // Set your desired background color here
                  padding: EdgeInsets.all(8.0),
                  child: SwitchButton(displayOption: Settings.englishFirst,),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: kYellow, // Set your desired background color here
                  padding: EdgeInsets.all(8.0),
                  child: SettingsTile(title: 'Reset', icon: Icon(Icons.refresh), callback: () async {
                    notifier.resetSettings();
                    runQuickBox(context: context, text: 'Settings Reset');
                    await DatabaseManager().removeDatabase();
                  },),
                ),
                Container(
                  color: kYellow, // Set your desired background color here
                  padding: EdgeInsets.all(8.0),
                  child: SettingsTile(title: 'Exit App', icon: Icon(Icons.exit_to_app), callback: (){
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
