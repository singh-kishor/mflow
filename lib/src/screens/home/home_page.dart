import 'package:flutter/material.dart';
import 'package:mflow/src/screens/home/widgets/product_list_widget.dart';
import 'package:mflow/src/screens/home/widgets/setting_action_button.dart';
import 'package:mflow/src/screens/home/widgets/summary_widget.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M Flow'),
        actions: const [
          SettingActionButton(),
        ],
      ),

      body: ListView(
        children: const [
          SummaryWidget(),
          ProductList(),
        ],
      ),
    );
  }
}
