import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mflow/src/modules/expense/data_class/expense.dart';
import 'package:mflow/src/modules/expense/model/expense_model.dart';
import 'package:mflow/src/util/model_registry.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key}) : super(key: key);

  static const routeName = '/expense';

  @override
  Widget build(BuildContext context) {
    ExpenseModel expenseModel = ModelRegistry.get(ExpenseModel);
    Future<List<Expense>> expenseHistoryFut = expenseModel.getAllExpenses();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              await expenseModel.createExpense(10.0);
              var allExpense = await expenseModel.getAllExpenses();
              print(allExpense);
            },
            child: const Text('Create expense'),
          ),
          FutureBuilder(
            future: expenseModel.getAllExpenses(),
            initialData: [],
            builder: (context, AsyncSnapshot<List<dynamic>> expenseHistoryFut) {
              if (expenseHistoryFut.connectionState == ConnectionState.none && expenseHistoryFut.hasData == null) {
                return Text('No Expenses Yet');
              }
              return Padding(
                padding: const EdgeInsets.all(50.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: expenseHistoryFut.data?.length,
                  itemBuilder: (context, index) {
                    Expense expenses = expenseHistoryFut.data?[index];
                    return ListTile(
                      title: Text(index.toString() + " => " + expenses.amount.toString()),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
