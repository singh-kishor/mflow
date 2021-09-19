import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(100),
      child: const Center(
        child: Text('Summary stats goes here!'),
      ),
    );
  }
}
