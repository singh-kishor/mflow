import 'package:flutter/material.dart';
import 'package:mflow/src/settings/settings_view.dart';

import '../home_page.dart';

class SettingActionButton extends StatelessWidget {
  const SettingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.restorablePushNamed(context, SettingsView.routeName);
      },
    );
  }
}
