import 'package:flutter/material.dart';
import 'package:mflow/src/features/expense/expense_home.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(12),
          title: const Text('Expense'),
          onTap: (){
            Navigator.restorablePushNamed(context, ExpensePage.routeName);
          },

        ),
      ],
    );
  }
}
